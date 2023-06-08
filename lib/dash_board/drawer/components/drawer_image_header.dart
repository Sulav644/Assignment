import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils.dart';

class DrawerImageHeader extends StatelessWidget {
  final BuildContext context;
  final String imgPath;
  final String title;
  final VoidCallback onClick;
  final bool expandDrawer;
  final bool showDrawerTitles;
  const DrawerImageHeader(
      {super.key,
      required this.context,
      required this.imgPath,
      required this.title,
      required this.onClick,
      required this.expandDrawer,
      required this.showDrawerTitles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: expandDrawer ? 0 : 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onClick(),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 3, 93, 158),
              child: Image.asset(
                imgPath,
                width: 26,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (expandDrawer && showDrawerTitles)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: Space(context: context).wdRat(0.03),
                      ),
                      Image.asset(
                        'assets/images/splash_logo.png',
                        height: 30,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
