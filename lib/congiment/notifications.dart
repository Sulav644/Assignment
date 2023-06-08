import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:xoomship/core/utils.dart';
import 'package:xoomship/dash_board/dash_board.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final cmp = Components();
    final spc = Space(context: context);

    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10));

    final gapBetweenInputFields = spc.hghtRat(0.02);
    const appColor = Color.fromARGB(255, 3, 93, 158);
    final boxShadow = [
      const BoxShadow(
          color: Color.fromARGB(255, 151, 147, 147),
          offset: Offset(0, 0),
          blurRadius: 4)
    ];
    final boxGap = spc.hghtRat(0.03);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 233, 245),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Color.fromARGB(255, 218, 233, 245),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: spc.wdRat(0.04)),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return DashBoard();
                    },
                  ));
                },
                child: CircleAvatar(child: Icon(Icons.arrow_back))),
            Text('notifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Container()
          ]),
          SizedBox(height: spc.hghtRat(0.02)),
          for (var i = 0; i < 2; i++)
            Column(
              children: [
                Row(
                  children: [
                    Text('Today',
                        style: TextStyle(
                            color: Color.fromARGB(255, 88, 87, 87),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: spc.hghtRat(0.02)),
                Padding(
                  padding: EdgeInsets.only(bottom: spc.hghtRat(0.02)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: boxShadow,
                    ),
                    child: Column(
                      children: [
                        for (var i = 0; i < 2; i++)
                          Column(
                            children: [
                              SizedBox(height: spc.hghtRat(0.02)),
                              Row(children: [
                                SizedBox(width: spc.wdRat(0.02)),
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.blue,
                                ),
                                SizedBox(width: spc.wdRat(0.02)),
                                CircleAvatar(
                                    child: Icon(Icons.notifications_outlined)),
                                SizedBox(width: spc.wdRat(0.03)),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'notification title',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'notification subtitle',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 117, 115, 115),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ])
                              ]),
                              SizedBox(height: spc.hghtRat(0.02)),
                            ],
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
        ]),
      ),
    );
  }
}
