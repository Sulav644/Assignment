import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils.dart';
import '../all_contacts/all_contacts.dart';
import '../all_contacts/data/models/add_data.dart';
import '../all_contacts/data/data_notifier.dart';
import 'components/contact_type_field.dart';
import 'components/email_field.dart';
import 'components/location_fields.dart';
import 'components/name_input_field.dart';
import 'components/password_input_field.dart';
import 'components/phone_field.dart';
import 'components/store_field.dart';
import 'components/toggle_button.dart';
import 'data/form_use_type.dart';
import 'domain/add_data_cubit.dart';
import 'domain/add_store_cubit.dart';
import 'domain/is_default_branch_location_cubit.dart';
import 'domain/is_enabled_product_upload_cubit.dart';
import 'domain/is_primary_address_cubit.dart';
import 'domain/store_temp_list_cubit.dart';

List<StoreTempData> totalStores(BuildContext context) =>
    context.watch<StoreTempListCubit>().state.data;
AddStoreCubit editStore(BuildContext context) => context.read<AddStoreCubit>();
void editAddData(BuildContext context) => context.read<AddDataCubit>();
PagedDataNotifier stateManager(BuildContext context) {
  final state = context.read<PagedDataNotifier>();
  return state;
}

SinglePagedDataNotifier singleStateManager(BuildContext context) {
  final state = context.read<SinglePagedDataNotifier>();
  return state;
}

class AddContact extends StatefulWidget {
  final String? loginController;
  final String? nameController;
  final String? passwordController;
  final String? emailController;
  final String? mobileController;
  final String? country;
  final String? contactCompanyController;
  final String? stateController;
  final String? zipCodeController;
  final String? cityController;
  final String? storeControllers;
  final int? contactType;
  final bool? enabledProduct;
  final bool? defaultBranch;
  final bool? primaryAddress;
  final FormUseType formUseType;
  const AddContact({
    super.key,
    this.loginController,
    this.nameController,
    this.passwordController,
    this.emailController,
    this.mobileController,
    this.country,
    this.contactCompanyController,
    this.stateController,
    this.zipCodeController,
    this.cityController,
    this.storeControllers,
    this.contactType,
    this.enabledProduct,
    this.defaultBranch,
    this.primaryAddress,
    required this.formUseType,
  });

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  late TextEditingController loginEditingController;
  late TextEditingController nameEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController mobileEditingController;
  late TextEditingController contactCompanyEditingController;
  late TextEditingController stateEditingController;
  late TextEditingController zipCodeEditingController;
  late TextEditingController cityEditingController;
  final FocusNode loginNode = FocusNode();
  final FocusNode nameNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode mobileNode = FocusNode();
  final FocusNode contactCompanyNode = FocusNode();
  final FocusNode stateNode = FocusNode();
  final FocusNode zipCodeNode = FocusNode();
  final FocusNode cityNode = FocusNode();
  final FocusNode storeNode = FocusNode();
  final List<FocusNode> storeNodes = [];
  final formKey = GlobalKey<FormState>();
  final storeList = [];
  String locationMessage = 'Current Location of the User';
  late String lat;
  late String long;
  int contactType = 0;
  bool isEnabledProduct = false;
  bool isPrimaryAddress = false;
  bool isDefaultBranchLocation = false;
  bool fieldsAlreadyInitialized = false;
  bool showLoading = false;
  int accountTypeId = 2;
  final storeCount = [];

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission permanently denied');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();

    loginEditingController =
        TextEditingController(text: widget.loginController ?? '');
    nameEditingController =
        TextEditingController(text: widget.nameController ?? '');
    passwordEditingController =
        TextEditingController(text: widget.passwordController ?? '');
    emailEditingController =
        TextEditingController(text: widget.emailController ?? '');
    mobileEditingController =
        TextEditingController(text: widget.mobileController ?? '');
    contactCompanyEditingController =
        TextEditingController(text: widget.contactCompanyController ?? '');
    stateEditingController =
        TextEditingController(text: widget.stateController ?? '');
    zipCodeEditingController =
        TextEditingController(text: widget.zipCodeController ?? '');
    cityEditingController =
        TextEditingController(text: widget.cityController ?? '');

    contactType = widget.contactType ?? 0;

    if (widget.storeControllers != null) {
      context.read<StoreTempListCubit>().deleteData();
      for (var element
          in widget.storeControllers!.split(',').map((e) => e).toList()) {
        context.read<StoreTempListCubit>().addData(text: element);
      }
    }
    _getCurrentLocation().then((value) {
      lat = '${value.latitude}';
      long = '${value.longitude}';
      setState(() {
        locationMessage = 'Latitude: $lat, Longitude $long';
      });
    }).then((value) {
      context.read<AddDataCubit>().setAddress('lat $lat, lng: $long');
    });
  }

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final cmp = Components();

    final storeCount = totalStores(context);
    for (var element in storeCount) {
      storeNodes.add(FocusNode());
    }
    final storesList = context.read<StoreTempListCubit>().state;
    const border =
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black));
    if (!fieldsAlreadyInitialized) {
      isEnabledProduct = widget.enabledProduct ??
          context.watch<IsEnabledProductUploadCubit>().state;
      isPrimaryAddress =
          widget.primaryAddress ?? context.watch<IsPrimaryAddressCubit>().state;
      isDefaultBranchLocation = widget.defaultBranch ??
          context.watch<IsDefaultBranchLocationCubit>().state;
      setState(() {
        fieldsAlreadyInitialized = true;
      });
    } else {
      isEnabledProduct = context.watch<IsEnabledProductUploadCubit>().state;
      isPrimaryAddress = context.watch<IsPrimaryAddressCubit>().state;
      isDefaultBranchLocation =
          context.watch<IsDefaultBranchLocationCubit>().state;
    }

    return GestureDetector(
      onTap: () {
        loginNode.unfocus();
        nameNode.unfocus();
        passwordNode.unfocus();
        emailNode.unfocus();
        mobileNode.unfocus();
        contactCompanyNode.unfocus();
        stateNode.unfocus();
        zipCodeNode.unfocus();
        cityNode.unfocus();
        for (var element in storeNodes) {
          element.unfocus();
        }
      },
      child: Scaffold(
        appBar: cmp.appBar,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 55,
                  child: Image.asset('assets/images/boy_1.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                NameInputField(
                  loginNode: loginNode,
                  nameNode: nameNode,
                  loginTxt: 'Login Name',
                  loginController: loginEditingController,
                  nameTxt: 'Name',
                  nameController: nameEditingController,
                  border: border,
                ),
                PasswordInputField(
                  node: passwordNode,
                  txt: 'Password',
                  border: border,
                  controller: passwordEditingController,
                ),
                EmailField(
                  node: emailNode,
                  txt: 'Email',
                  border: border,
                  controller: emailEditingController,
                ),
                PhoneField(
                  node: mobileNode,
                  txt: 'Phone',
                  border: border,
                  controller: mobileEditingController,
                ),
                LocationFields(
                  contactCompanyNode: contactCompanyNode,
                  stateNode: stateNode,
                  zipCodeNode: zipCodeNode,
                  cityNode: cityNode,
                  border: border,
                  country: widget.country,
                  contactCompanyController: contactCompanyEditingController,
                  stateController: stateEditingController,
                  zipCodeController: zipCodeEditingController,
                  cityController: cityEditingController,
                ),
                ...List.generate(
                  storeCount.length,
                  (index) => StoreField(
                      node: storeNodes[index],
                      controller: storeCount[index].text,
                      border: border,
                      onClick: () {},
                      onChange: (val) {},
                      index: index,
                      icon: Icons.add,
                      txt: 'Store Name'),
                ),
                ContactType(
                  contactType: contactType,
                  customerValue: (val) {
                    setState(() {
                      contactType = val!;
                    });
                    context.read<AddDataCubit>().setContactType('CUSTOMER');
                  },
                  shopkeeperValue: (val2) {
                    setState(() {
                      contactType = val2!;
                    });
                    context.read<AddDataCubit>().setContactType('SHOPKEEPER');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ToggleButton(
                  title: 'Enable Product Upload',
                  status: isEnabledProduct,
                  onClick: () {
                    context.read<IsEnabledProductUploadCubit>().toggleState();
                    context
                        .read<AddDataCubit>()
                        .setEnabledProduct(isEnabledProduct);
                  },
                ),
                ToggleButton(
                  title: 'Default Branch Location',
                  status: isDefaultBranchLocation,
                  onClick: () {
                    context.read<IsDefaultBranchLocationCubit>().toggleState();
                    context
                        .read<AddDataCubit>()
                        .setDefaultBranch(isDefaultBranchLocation);
                  },
                ),
                ToggleButton(
                  title: 'Primary Address',
                  status: isPrimaryAddress,
                  onClick: () {
                    context.read<IsPrimaryAddressCubit>().toggleState();
                    context
                        .read<AddDataCubit>()
                        .setPrimaryAddress(isPrimaryAddress);
                  },
                ),
                SizedBox(
                  width: spc.wdRat(0.4),
                  child: ElevatedButton(
                      onPressed: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm) {
                          final int? db = prefs.getInt('accountTypeId');

                          if (db == null) {
                            await prefs.setInt('accountTypeId', 2);
                            setState(() {
                              accountTypeId = 2;
                            });
                          } else {
                            final newdb = prefs.getInt('accountTypeId');
                            int id = newdb!;
                            setState(() {
                              accountTypeId = id + 1;
                            });
                            await prefs.setInt('accountTypeId', id + 1);
                          }

                          setState(() {
                            showLoading = true;
                          });
                          final list = storesList.data
                              .map((e) => {"Text": e.text})
                              .toList();
                          context
                              .read<AddDataCubit>()
                              .setAccountTypeId(accountTypeId);
                          context.read<AddDataCubit>().setStores(list);

                          final data = context.read<AddDataCubit>().state;

                          context
                              .read<SinglePagedDataNotifier>()
                              .addData(data: data.toJson())
                              .then((value) {
                            if (value["statusCode"] == 200) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Contact added')));
                            } else if (value["body"]
                                .toString()
                                .contains('Stores list must be unique')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Stores list must be unique')));
                            } else if (value["body"]
                                .toString()
                                .contains('LoginName, Mobile, Email')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'LoginName, mobile, email must be unique')));
                            } else if (value["body"]
                                .toString()
                                .contains('The Country field is required')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Country field is required')));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Unknown issue')));
                            }
                            setState(() {
                              showLoading = false;
                            });
                          });
                        }
                      },
                      child: showLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            )
                          : const Text('Create Contact')),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          stateManager(context).getPage(
                            jsonDataSelector: (json) => json as List<dynamic>,
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AllContacts(),
                          ));
                        },
                        child: const Text('View All Contacts')),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
