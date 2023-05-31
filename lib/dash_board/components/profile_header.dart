import 'package:flutter/material.dart';
import '../../../core/utils.dart';
import '../../core/components/add_icon.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Column(
      children: [
        SizedBox(
          height: spc.hghtRat(0.03),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: spc.wdRat(0.04)),
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      child: Image.asset('assets/images/boy_1.png'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Emmy Yost',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Exclusive Marketer',
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 138, 136, 136)),
                        ),
                      ]),
                ),
              ],
            ),
            AddIcon()
            // ElevatedButton(
            //     style: ButtonStyle(
            //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20)))),
            //     onPressed: () {
            //       Scaffold.of(context).openDrawer();
            //     },
            //     child: Text('Load'))
          ],
        ),
      ],
    );
  }
}
