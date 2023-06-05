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
          address: place.administrativeArea!,
          area: place.street!,
          landmark: place.thoroughfare!,
          city: place.subAdministrativeArea!,
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
      appBar: cmp.appBar,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: spc.wdRat(0.06)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const ProfileHeader(),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: spc.wdRat(0.6),
                          child: const Text(
                            "Hey, Emmy Yost, let's dive into the details.🙌",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                height: 1.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(height: 175.0),
                    items: [
                      'assets/images/banner.jpg',
                      'assets/images/banner2.png',
                      'assets/images/banner3.png',
                      'assets/images/banner4.png'
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 190,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 160, 160, 160),
                                          blurRadius: 12,
                                          offset: Offset(0, 6)),
                                    ]),
                                child: Image.asset(
                                  i,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TabBarPage(),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
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
      endDrawer: const AppDrawer(),
    );
  }
}
