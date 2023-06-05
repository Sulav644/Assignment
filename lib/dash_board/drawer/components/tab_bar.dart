import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/utils.dart';

class TabBarForDrawer extends StatelessWidget {
  final int tabIndex;
  final TabController tabController;
  final void Function(int) onClick;
  const TabBarForDrawer(
      {super.key,
      required this.tabController,
      required this.onClick,
      required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: Space(context: context).wdRat(0.08)),
      child: Container(
        child: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.transparent,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
                color: const Color.fromARGB(255, 7, 106, 187),
                borderRadius: BorderRadius.circular(10)),
            controller: tabController,
            onTap: (value) => onClick(value),
            tabs: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'PERSONAL',
                  style: TextStyle(
                      color: tabIndex == 0
                          ? Colors.white
                          : const Color.fromARGB(255, 141, 135, 135),
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'BUSINESS',
                  style: TextStyle(
                      color: tabIndex == 1
                          ? Colors.white
                          : const Color.fromARGB(255, 141, 135, 135),
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ]),
      ),
    );
  }
}
