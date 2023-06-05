import 'package:xoomship/contacts/all_contacts/data/data_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../contacts/add_contact_form/add_contact.dart';
import '../../contacts/add_contact_form/data/form_use_type.dart';
import '../../contacts/add_contact_form/domain/add_data_cubit.dart';
import '../../contacts/add_contact_form/domain/add_store_cubit.dart';
import '../../contacts/add_contact_form/domain/is_default_branch_location_cubit.dart';
import '../../contacts/add_contact_form/domain/is_enabled_product_upload_cubit.dart';
import '../../contacts/add_contact_form/domain/is_primary_address_cubit.dart';
import '../../contacts/add_contact_form/domain/select_country_cubit.dart';
import '../../contacts/add_contact_form/domain/store_temp_list_cubit.dart';
import '../utils.dart';

class AddContactView extends StatelessWidget {
  final FormUseType formUseType;
  const AddContactView({super.key, required this.formUseType});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddStoreCubit(),
        ),
        BlocProvider(
          create: (context) => IsEnabledProductUploadCubit(),
        ),
        BlocProvider(
          create: (context) => IsDefaultBranchLocationCubit(),
        ),
        BlocProvider(
          create: (context) => IsPrimaryAddressCubit(),
        ),
        BlocProvider(
          create: (context) => SelectCountryCubit(),
        ),
        BlocProvider(
          create: (context) => StoreTempListCubit(),
        ),
        BlocProvider(
          create: (context) => AddDataCubit(),
        ),
      ],
      child: formUseType == const FormUseType.update()
          ? BlocBuilder<SinglePagedDataNotifier, SinglePagedDataState>(
              builder: (context, state) {
                context.read<AddDataCubit>().setAddData(
                    state.data.loginName!,
                    state.data.name!,
                    state.data.password!,
                    state.data.emailId!,
                    state.data.mobile!,
                    state.data.country!,
                    state.data.contactCompany!,
                    state.data.state!,
                    state.data.zipCode!,
                    state.data.city!,
                    state.data.storeName!,
                    state.data.contactCompany!,
                    state.data.isEnableProductUpload!,
                    state.data.isDefaultBranchLocation!,
                    state.data.isPrimaryAddress!);
                return state.map(
                  initial: (_) => Material(child: Container()),
                  loadInProgress: (_) => Material(
                    child: SizedBox(
                      height: spc.hghtRat(1),
                      child: Column(
                        children: [
                          SizedBox(
                            height: spc.hghtRat(0.4),
                          ),
                          const CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ),
                  loadSuccess: (_) => AddContact(
                    loginController: _.data.loginName,
                    nameController: _.data.name,
                    passwordController: _.data.password,
                    emailController: _.data.emailId,
                    mobileController: _.data.mobile,
                    country: _.data.country,
                    contactCompanyController: _.data.contactCompany,
                    stateController: _.data.state,
                    zipCodeController: _.data.zipCode,
                    cityController: _.data.city,
                    storeControllers: _.data.storeName!,
                    contactType: _.data.contactType == 'Customer' ? 0 : 1,
                    enabledProduct: _.data.isEnableProductUpload,
                    defaultBranch: _.data.isDefaultBranchLocation,
                    primaryAddress: _.data.isPrimaryAddress,
                    formUseType: formUseType,
                  ),
                  loadFailure: (_) => const Text('no data'),
                );
              },
            )
          : AddContact(
              formUseType: formUseType,
            ),
    );
  }
}
