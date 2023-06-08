import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color textColor;
  final Color iconColor;
  final bool expandDrawer;
  final bool showDrawerTitles;
  final VoidCallback onIconClick;
  final VoidCallback onItemClick;
  const DrawerItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.textColor,
      required this.iconColor,
      required this.onIconClick,
      required this.onItemClick,
      required this.expandDrawer,
      required this.showDrawerTitles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: expandDrawer ? 0 : 10),
      child: GestureDetector(
        onTap: () => onIconClick(),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 40,
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                radius: 35,
                child: Icon(
                  icon,
                  size: 30,
                  color: iconColor,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            if (expandDrawer && showDrawerTitles)
              GestureDetector(
                onTap: () => onItemClick(),
                child: Text(
                  title,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.5),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
