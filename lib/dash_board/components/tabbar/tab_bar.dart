import 'package:assignment_project/dash_board/components/tabbar/tabbar_item.dart';
import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../chart_banner/chat_banner.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  late TabController tabController;
  int index = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Column(
      children: [
        Row(
          children: [
            TabBar(
                labelPadding: EdgeInsets.zero,
                indicatorColor: Colors.transparent,
                isScrollable: true,
                controller: tabController,
                onTap: (value) => setState(() {
                      index = value;
                    }),
                tabs: [
                  TabBarItem(
                    labelIndex: 0,
                    indIndex: index,
                    title: 'Standard',
                  ),
                  TabBarItem(
                    labelIndex: 1,
                    indIndex: index,
                    title: 'Economy',
                  ),
                  TabBarItem(
                    labelIndex: 2,
                    indIndex: index,
                    title: 'Express',
                  ),
                ]),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: spc.hghtRat(0.65),
          child: TabBarView(controller: tabController, children: const [
            ChatBanner(),
            ChatBanner(),
            ChatBanner(),
          ]),
        ),
      ],
    );
  }
}
