import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:xoomship/congiment/my_order.dart';
import 'package:xoomship/core/utils.dart';

class BookingPage extends StatefulWidget {
  final BuildContext context;
  const BookingPage({super.key, required this.context});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  double qrCodeSize = 150;
  bool hasSetQrCodeSize = false;
  late ScrollController scrollController;
  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (scrollController.offset > 71) {
        print(scrollController.offset);
        setState(() {});
      }
    }
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (scrollController.offset < 71) {
        print(scrollController.offset);
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(_scrollListener);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return MyOrder();
                },
              ));
            },
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.6,
                maxChildSize: 0.9,
                snap: true,
                builder: (context, controller) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Padding(
                            padding: EdgeInsets.all(
                                Space(context: context).wdRat(0.04)),
                            child: NotificationListener(
                              onNotification:
                                  (ScrollNotification notification) {
                                if (notification.metrics.pixels ==
                                    notification.metrics.maxScrollExtent) {
                                  print(notification.metrics.pixels ==
                                      notification.metrics.maxScrollExtent);

                                  setState(() {
                                    qrCodeSize = 330;
                                  });
                                } else if (notification.metrics.pixels ==
                                    notification.metrics.minScrollExtent) {
                                  print(notification.metrics.pixels ==
                                      notification.metrics.maxScrollExtent);

                                  setState(() {
                                    qrCodeSize = 150;
                                  });
                                }
                                return true;
                              },
                              child:
                                  ListView(controller: controller, children: [
                                Text('Booking id',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 116, 108, 108),
                                    )),
                                Text('Mr. Mickvil',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red,
                                    )),
                                SizedBox(height: 10),
                                Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 196, 222, 243),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Column(
                                        children: [
                                          Text('From Origin',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 116, 108, 108),
                                              )),
                                          Text('India',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    )),
                                SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 196, 222, 243),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Column(
                                      children: [
                                        Text('To Destination',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  255, 116, 108, 108),
                                            )),
                                        Text('US',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Total Pack',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  255, 116, 108, 108),
                                            )),
                                        Text('2 Packs',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text('Total Weight',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  255, 116, 108, 108),
                                            )),
                                        Text('65 Kg',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    for (var i = 0; i < 18; i++)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: Container(
                                            width: Space(context: context)
                                                .wdRat(0.04),
                                            height: 1,
                                            color: Colors.black),
                                      ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Show at Pickup Boy',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 600),
                                      width: qrCodeSize,
                                      height: qrCodeSize,
                                      child: QrImageView(
                                        data: 'hello',
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                          ));
                    },
                  );
                },
              ),
            ),
          );
        },
      );
    });
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Scaffold(
        backgroundColor: Colors.blue,
        // This is handled by the search bar itself.
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return MyOrder();
                          },
                        ));
                      },
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_back,
                          ))),
                )),
            Text('UR Shipment',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            Container(),
          ]),
          SizedBox(height: spc.hghtRat(0.04)),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('India'),
                        SizedBox(height: 4),
                        Text('IND',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('United States'),
                        SizedBox(height: 4),
                        Text('US',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.w600))
                      ],
                    )
                  ]),
            ),
          )
        ]));
  }
}
