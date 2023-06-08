import 'package:custom_pointed_popup/custom_pointed_popup.dart';
import 'package:custom_pointed_popup/utils/triangle_painter.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomship/congiment/my_order.dart';
import 'package:xoomship/congiment/order_track.dart';
import 'package:xoomship/dash_board/dash_board.dart';
import 'package:xoomship/dash_board/drawer/bloc/location_details_cubit.dart';
import '../../core/components/profile_banner_left.dart';
import '../core/utils.dart';
import '../sign_up/phone_number_send_screen.dart';
import 'components/bottom_navigation.dart';
import 'components/connect_apps.dart';
import 'components/divider_line.dart';
import 'components/profile_pic.dart';
import 'components/stats_bar.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class ProfilePage extends StatefulWidget {
  final String imgPath;
  const ProfilePage({super.key, required this.imgPath});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey widgetKey = GlobalKey();
  int pageIndex = 0;
  GlobalKey menuKey = GlobalKey();
  double posX = 0;
  double posY = 0;
  bool showMenu = false;

  CustomPointedPopup getCustomPointedPopup(BuildContext context) {
    return CustomPointedPopup(
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      context: context,

      widthFractionWithRespectToDeviceWidth: 3,
      displayBelowWidget: true,
      triangleDirection: TriangleDirection.Straight,
      popupElevation: 10,

      ///you can also add border radius
      ////popupBorderRadius:,
      item: CustomPointedPopupItem(
        title: '',
        textStyle: Theme.of(context).textTheme.caption!.copyWith(
              color: Theme.of(context).cardColor,
            ),

        iconWidget:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    // showLoadButton = !showLoadButton;
                    // isConfirmedPickedUp = false;
                  });
                  Scaffold.of(context).openEndDrawer();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: Image.asset(
                    'assets/images/boy_1.png',
                    height: 30,
                  ),
                  radius: 20.0,
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Text(
                      'Emmy Yost',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                // Text(
                //   '${locationDetails.city} ${locationDetails.address}',
                //   style: TextStyle(
                //       fontSize: 10,
                //       color: Color.fromARGB(255, 138, 136, 136)),
                // ),
              ]),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(Space(context: context).wdRat(0.04)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 18,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'My Account',
                        style: TextStyle(
                            color: Color.fromARGB(255, 54, 53, 53),
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 1;
                      });

                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //   builder: (context) {
                      //     return MyOrder();
                      //   },
                      // ));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.room_service_outlined,
                          size: 18,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Order History',
                          style: TextStyle(
                              color: Color.fromARGB(255, 54, 53, 53),
                              fontWeight: FontWeight.w500,
                              fontSize: 13.5),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 2;
                      });
                      // Navigator.of(context).pop();
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //   builder: (context) {
                      //     return OrderTrack();
                      //   },
                      // ));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.near_me_rounded,
                          size: 18,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Track',
                          style: TextStyle(
                              color: Color.fromARGB(255, 54, 53, 53),
                              fontWeight: FontWeight.w500,
                              fontSize: 13.5),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.wallet_outlined,
                        size: 18,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'My Wallet',
                        style: TextStyle(
                            color: Color.fromARGB(255, 54, 53, 53),
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 18,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Settings',
                        style: TextStyle(
                            color: Color.fromARGB(255, 54, 53, 53),
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_offer_outlined,
                        size: 18,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Reference',
                        style: TextStyle(
                            color: Color.fromARGB(255, 54, 53, 53),
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),

        ///Or you can add custom item widget below instead above 3
        ///itemWidget: Container(),
      ),
      onClickWidget: (onClickMenu) {
        print(onClickMenu);

        print('popup item clicked');
      },
      onDismiss: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return MyOrder();
          },
        ));
        print('on dismissed called');
      },
    );
  }

  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final locationDetails = context.watch<LocationDetailsCubit>().state;

    return GestureDetector(
      onTap: () {
        setState(() {
          showMenu = false;
        });
      },
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
                child: SingleChildScrollView(
              child: SizedBox(
                  width: spc.wdRat(1),
                  child: Column(children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) {
                                  return DashBoard();
                                },
                              ));
                            },
                            child: Icon(Icons.arrow_back)),
                        GestureDetector(
                            onTap: () {
                              // getCustomPointedPopup(context)
                              //   ..show(
                              //     widgetKey: widgetKey,
                              //   );
                              final RenderBox renderBox = menuKey.currentContext
                                  ?.findRenderObject() as RenderBox;

                              final Size size = renderBox
                                  .size; // or _widgetKey.currentContext?.size
                              print('Size: ${size.width}, ${size.height}');

                              final Offset offset =
                                  renderBox.localToGlobal(Offset.zero);
                              setState(() {
                                posX = offset.dx;
                                posY = offset.dy;
                                showMenu = !showMenu;
                              });
                              print('Offset: ${offset.dx}, ${offset.dy}');
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: Icon(
                                Icons.more_vert,
                                key: menuKey,
                              ),
                            )),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return PhoneNumberSendScreen();
                          },
                        ));
                      },
                      child: ProfilePic(
                        imgPath: widget.imgPath,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.power_settings_new_outlined,
                                color: Color.fromARGB(255, 3, 93, 158)),
                            SizedBox(width: 8),
                            Text(
                              'Sign Out',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 3, 93, 158),
                                  fontWeight: FontWeight.w600),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: spc.hghtRat(0.022),
                    ),
                    const Text(
                      'Emmy Yost',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${locationDetails.city} ${locationDetails.address}',
                      style: TextStyle(
                          fontSize: 12, color: Color.fromARGB(255, 97, 95, 95)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: const [
                        StatsBar(),
                        DividerLine(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ConnectApps(),
                    SizedBox(
                      height: spc.hghtRat(0.02),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: spc.wdRat(0.07)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var i = 0; i < 3; i++)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 8, right: 8),
                                  child: ProfileBannerLeft(
                                    techColor: Colors.black,
                                    serviceColor:
                                        Color.fromARGB(255, 70, 68, 68),
                                    bannerColor: Colors.white,
                                    iconColor:
                                        Color.fromARGB(255, 120, 120, 120),
                                    iconBgColor:
                                        Color.fromARGB(255, 238, 220, 193),
                                    imgPath: 'google_analytics.png',
                                    tech: 'Google Analytics',
                                    service: 'Ads Tracking',
                                    hasShadow: true,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: spc.hghtRat(0.02)),
                    // Padding(
                    //   padding: EdgeInsets.only(left: spc.wdRat(0.07)),
                    //   child: Row(children: [
                    //     Icon(Icons.power_settings_new_outlined,
                    //         color: Color.fromARGB(255, 3, 93, 158)),
                    //     SizedBox(width: 8),
                    //     Text(
                    //       'Sign Out',
                    //       style: TextStyle(
                    //           color: Color.fromARGB(255, 3, 93, 158),
                    //           fontWeight: FontWeight.w600),
                    //     )
                    //   ]),
                    // ),
                    SizedBox(height: spc.hghtRat(0.03)),
                    Padding(
                      padding: EdgeInsets.only(left: spc.wdRat(0.07)),
                      child: Row(
                        children: [
                          Text(
                            'My Wallet',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: spc.hghtRat(0.01)),
                    Stack(
                      children: const [
                        StatsBar(),
                        DividerLine(),
                      ],
                    ),
                    SizedBox(height: spc.hghtRat(0.01)),
                  ])),
            )),
            if (showMenu)
              Positioned(
                top: posY + spc.hghtRat(0.04),
                left: posX - spc.wdRat(0.34),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 44, 43, 43),
                        blurRadius: 50.0,
                        spreadRadius: 10.0,
                      )
                    ],
                  ),
                  child: ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 1),
                                  blurRadius: 20)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: spc.wdRat(0.3)),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      Space(context: context).wdRat(0.04)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              size: 18,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              'My Account',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 54, 53, 53),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.5),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showMenu = false;
                                            });

                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                              builder: (context) {
                                                return MyOrder();
                                              },
                                            ));
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.room_service_outlined,
                                                size: 18,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'Order History',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 54, 53, 53),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showMenu = false;
                                            });

                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                              builder: (context) {
                                                return OrderTrack();
                                              },
                                            ));
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.near_me_rounded,
                                                size: 18,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'Track',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 54, 53, 53),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.wallet_outlined,
                                              size: 18,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              'My Wallet',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 54, 53, 53),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.5),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.settings,
                                              size: 18,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              'Settings',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 54, 53, 53),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.5),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.local_offer_outlined,
                                              size: 18,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              'Reference',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 54, 53, 53),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.5),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        )),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 10);
    // path.quadraticBezierTo(0, 20, size.width - 80, 24);
    // path.quadraticBezierTo(size.width, 30, size.width, 50);
    path.lineTo(size.width - 40, 10);
    path.lineTo(size.width - 30, 0);
    path.lineTo(size.width - 20, 10);
    path.lineTo(size.width, 10);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
