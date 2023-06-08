import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils.dart';
import '../../../congiment/congiment_after_package_selection.dart';
import '../../../congiment/congiment_page.dart';
import '../../../congiment/congiment_view.dart';
import '../../../core/components/bloc/country_flag_cubit.dart';
import '../../../core/components/profile_banner_centered.dart';

class ChatBanner extends StatelessWidget {
  const ChatBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final flagState = context.watch<CountryFlagCubit>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
          width: spc.wdRat(1),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 173, 209, 238),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: spc.wdRat(0.055)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: spc.hghtRat(0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Load bag in ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 3, 93, 158))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ConsignmentAfterPackageSelection();
                          },
                        ));
                      },
                      child: Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
              SizedBox(
                height: spc.hghtRat(0.01),
              ),
              Row(
                children: [
                  const Text(
                    "65",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 17, 111, 189)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "kg",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 17, 111, 189)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: spc.hghtRat(0.018),
              ),
              const Text(
                "You've got it 👋",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: spc.hghtRat(0.02),
              ),
              Container(
                  width: spc.wdRat(1),
                  height: spc.hghtRat(0.2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          '₹',
                          style: TextStyle(fontSize: 25, color: Colors.red),
                        ),
                      ),
                      Text(
                        '550/',
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          'kg',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )),

              // SizedBox(
              //   width: spc.wdRat(1),
              //   height: spc.hghtRat(0.15),
              //   // child:
              //   // Padding(
              //   //   padding: const EdgeInsets.only(right: 12.0),
              //   //   child:
              //   //   Image.asset(
              //   //     'assets/images/curve.png',
              //   //     fit: BoxFit.cover,
              //   //   ),
              //   // ),
              // ),
              SizedBox(height: 10),
              const Text(
                "Shipment to US",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: spc.hghtRat(0.025),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ProfileBannerCentered(
                    nameColor: Colors.black,
                    msgColor: Color.fromARGB(255, 51, 50, 50),
                    bannerColor: Colors.white,
                    iconColor: Color.fromARGB(255, 155, 151, 151),
                    iconBgColor: Color.fromARGB(255, 238, 158, 185),
                    imgPath: 'boy_1.png',
                    name: 'India',
                    messages: 'From Origin',
                    hasShadow: true,
                    flag: flagState[0].flag,
                    countryName: flagState[0].countryName,
                    index: 0,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ProfileBannerCentered(
                      nameColor: Colors.white,
                      msgColor: Color.fromARGB(255, 221, 218, 218),
                      bannerColor: Color.fromARGB(255, 13, 97, 165),
                      iconColor: Colors.white,
                      iconBgColor: Color.fromARGB(255, 149, 198, 238),
                      imgPath: 'boy_2.png',
                      name: 'US',
                      messages: 'To Destination',
                      hasShadow: false,
                      flag: flagState[1].flag,
                      countryName: flagState[1].countryName,
                      index: 1),
                ],
              ),
            ]),
          )),
    );
  }
}
