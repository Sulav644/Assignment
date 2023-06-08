import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:xoomship/dash_board/components/floating_icon_status_cubit.dart';

import '../core/utils.dart';
import 'components/profile_header_reverse.dart';
import 'drawer/bloc/location_details_cubit.dart';
import 'drawer/drawer.dart';
import 'components/profile_header.dart';
import 'components/tabbar/tab_bar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool showFloatingProfile = false;
  String lat = '';
  String long = '';
  String? _currentAddress;
  Position? _currentPosition;
  late ScrollController scrollController;
  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (scrollController.offset > 71) {
        setState(() {
          showFloatingProfile = true;
        });
      }
    }
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (scrollController.offset < 71) {
        setState(() {
          showFloatingProfile = false;
        });
      }
    }
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      print('place ${placemarks[0]}');
      context.read<LocationDetailsCubit>().setDetails(
          address: place.street!,
          area: place.subAdministrativeArea!,
          stateName: place.administrativeArea!,
          landmark: place.thoroughfare!,
          city: place.locality!,
          zipCode: place.postalCode!,
          country: place.country!);
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e.toString());
    });
    print('address $_currentAddress');
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      // setState(() => _currentPosition = position);
      print('value ${position}');
      context.read<LocationDetailsCubit>().setLatLong(
          lat: position.latitude.toString(),
          long: position.longitude.toString());
      List<Placemark> placemarks =
          await placemarkFromCoordinates(52.2165157, 6.9437819);
      print('place ${placemarks[0].country}');
      _getAddressFromLatLng(position);
    }).catchError((e) {
      debugPrint('error ${e.toString()}');
    });
  }

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
    scrollController = ScrollController()..addListener(_scrollListener);
    _getCurrentLocation().then((value) {
      lat = '${value.latitude}';
      long = '${value.longitude}';
      print('$lat $long');
      setState(() {});
    }).then((value) {});
    _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final cmp = Components();
    final floatingIconState = context.watch<ConfirmedPickupCubit>().state;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Color.fromARGB(255, 3, 93, 158),

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 3, 93, 158),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: spc.wdRat(0.07)),
                      child: const ProfileHeader(),
                    ),
                    SizedBox(
                      height: spc.hghtRat(0.05),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: spc.wdRat(0.07)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: spc.wdRat(0.6),
                            child: const Text(
                              "Hey, Emmy Yost, let's dive into the details.🙌",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  height: 1.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: spc.hghtRat(0.03),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: spc.wdRat(0.05)),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          viewportFraction: 1,
                        ),
                        items: [
                          'assets/images/banner.jpg',
                          'assets/images/banner2.png',
                          'assets/images/banner3.png',
                          'assets/images/banner4.png'
                        ].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FittedBox(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      i,
                                      width: spc.wdRat(1),
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spc.wdRat(0.06)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const TabBarPage(),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 200, 200, 200),
                                    offset: Offset(0, 0),
                                    blurRadius: 15)
                              ]),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    'FEATURING FRESH',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 150, 150, 150),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/images/hands_shake.png',
                                height: spc.hghtRat(0.2),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'friends always share!',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 3, 93, 158),
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'refer your friends to Postpaid and get ₹300 off on',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              Text('your next bill'),
                              SizedBox(height: 20),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: spc.wdRat(0.13),
                                        vertical: spc.hghtRat(0.01)),
                                    child: Text(
                                      'REFER NOW',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              SizedBox(height: 20),
                            ],
                          )),
                      SizedBox(height: spc.hghtRat(0.1)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (showFloatingProfile)
            Positioned(
              top: spc.hghtRat(0.84),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const ProfileHeaderReverse(),
              ),
            ).animate().fade(),
        ],
      ),
      drawer: const AppDrawer(),
    );
  }
}
