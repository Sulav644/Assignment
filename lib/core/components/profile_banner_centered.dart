import 'package:country_flags/country_flags.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomship/profile_page/profile_page.dart';
import 'package:flutter/material.dart';

import '../utils.dart';
import 'bloc/country_flag_cubit.dart';

class ProfileBannerCentered extends StatelessWidget {
  final Color nameColor;
  final Color msgColor;
  final Color bannerColor;
  final Color iconColor;
  final Color iconBgColor;
  final String imgPath;
  final String name;
  final String messages;
  final bool hasShadow;
  final String flag;
  final String countryName;
  final int index;
  const ProfileBannerCentered(
      {super.key,
      required this.imgPath,
      required this.name,
      required this.messages,
      required this.bannerColor,
      required this.hasShadow,
      required this.iconColor,
      required this.nameColor,
      required this.msgColor,
      required this.iconBgColor,
      required this.flag,
      required this.index,
      required this.countryName});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return GestureDetector(
      onTap: () {
        if (index == 1) {
          showCountryPicker(
            context: context,
            showPhoneCode: false,
            onSelect: (value) {
              context.read<CountryFlagCubit>().setFlage(
                  index: index,
                  flag: value.countryCode,
                  countryName: value.displayName
                      .substring(0, value.displayName.indexOf('(')));
              print(value.countryCode == 'AL');
              print(value.countryCode);
            },
          );
        }
      },
      child: Container(
          width: spc.wdRat(0.33),
          decoration: BoxDecoration(
              color: bannerColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: hasShadow
                        ? const Color.fromARGB(255, 81, 164, 228)
                        : Colors.transparent,
                    offset: const Offset(-4, 4),
                    blurRadius: 25)
              ]),
          child: Column(children: [
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: spc.wdRat(0.27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.more_horiz,
                    color: iconColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: spc.wdRat(0.05),
                  right: spc.wdRat(0.05),
                  bottom: spc.wdRat(0.05)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (index == 1)
                        showCountryPicker(
                          context: context,
                          showPhoneCode: false,
                          onSelect: (value) {
                            context.read<CountryFlagCubit>().setFlage(
                                index: index,
                                flag: value.countryCode,
                                countryName: value.displayName.substring(
                                    0, value.displayName.indexOf('(')));
                            print(value.countryCode == 'AL');
                            print(value.countryCode);
                          },
                        );
                    },
                    child: CountryFlag.fromCountryCode(
                      '$flag',
                      height: 48,
                      width: 50,
                      borderRadius: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    countryName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: nameColor,
                        fontWeight: FontWeight.w600,
                        fontSize: countryName.split(' ').length > 1 ? 12 : 14),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '$messages',
                    style: TextStyle(
                        color: msgColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
