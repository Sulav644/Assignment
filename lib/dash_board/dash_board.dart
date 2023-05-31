import 'package:flutter/material.dart';

import '../core/utils.dart';
import 'components/drawer.dart';
import 'components/profile_header.dart';
import 'components/tabbar/tab_bar.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    int i = 0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: spc.wdRat(0.06)),
          child: Column(
            children: [
              const ProfileHeader(),
              const SizedBox(
                height: 18,
              ),
              Row(
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
              const SizedBox(
                height: 24,
              ),
              const TabBarPage()
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
