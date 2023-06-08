import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import '../core/utils.dart';
import '../dash_board/dash_board.dart';
import 'my_order.dart';

class ConsignmentPage extends StatefulWidget {
  const ConsignmentPage({super.key});

  @override
  State<ConsignmentPage> createState() => _ConsignmentPageState();
}

class _ConsignmentPageState extends State<ConsignmentPage> {
  FocusNode addressNode = FocusNode();
  FocusNode areaNode = FocusNode();
  FocusNode landmarkNode = FocusNode();
  FocusNode cityNode = FocusNode();
  FocusNode zipcodeNode = FocusNode();
  FocusNode countryNode = FocusNode();
  bool showLoadButton = true;
  bool isConfirmedPickedUp = false;
  late AnimationController controller;
  double sliderValue = 0.0;
  bool switchSlabValue = true;
  bool switchSelectBoxSplitValue = true;
  bool switchDestinationValue = true;
  bool switchSelfDropValue = true;
  bool switchSelfDropOffValue = true;
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
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
          blurRadius: 10)
    ];
    final boxGap = spc.hghtRat(0.03);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(
            'Consignment Booking',
            style: TextStyle(
                color: appColor, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const DashBoard();
                    },
                  ));
                },
                icon: const Icon(Icons.close))
          ]),
      // floatingActionButton: FloatingActionButton(onPressed: () {}),
      // bottomSheet: BottomSheet(
      //   builder: (context) {
      //     return Container();
      //   },
      //   onClosing: () {},
      // ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(spc.wdRat(0.05)),
              child: Column(children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: boxShadow),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Standard',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 3, 93, 158)),
                                ),
                                SizedBox(
                                    width: spc.wdRat(0.5),
                                    child: const Text(
                                      'Upto 5 \$cashback',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )),
                                SizedBox(
                                    width: spc.wdRat(0.5),
                                    child: const Text(
                                      'with each of your first 3 months',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '65',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 3, 93, 158)),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.blue,
                                    child: Icon(
                                      Icons.check,
                                      size: 18,
                                    ))
                              ],
                            ),
                          ]),
                    )),
                SizedBox(height: spc.hghtRat(0.03)),
                //third container
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: boxShadow),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Load In Bag',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 3, 93, 158)),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: spc.wdRat(0.2),
                                      child: const Text(
                                        'Is Slab',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Switch(
                                      value: switchSlabValue,
                                      activeColor: const Color(0xFF6200EE),
                                      onChanged: (bool value) {
                                        setState(() {
                                          switchSlabValue = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    sliderValue != 0.0
                                        ? sliderValue.toString().substring(0, 6)
                                        : '0.0'
                                            'kg',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: spc.wdRat(0.77),
                                alignment: Alignment.centerLeft,
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    overlayShape: SliderComponentShape.noThumb,
                                  ),
                                  child: Slider(
                                    value: sliderValue,
                                    max: 600,
                                    label: sliderValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        sliderValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: spc.hghtRat(0.03),
                ),
                //first container
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 177, 172, 172)),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: boxShadow),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spc.wdRat(0.04),
                        vertical: spc.hghtRat(0.028)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Type of Shipment',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 3, 93, 158),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Stack(
                          children: [
                            Container(
                              width: spc.wdRat(1),
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 18, left: 10, right: 10),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      isExpanded: true,
                                      icon: const Icon(Icons.arrow_drop_down,
                                          color: Colors.black),
                                      items: [
                                        ...['Documents']
                                            .map((e) => DropdownMenuItem(
                                                    child: Text(
                                                  e,
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 3, 93, 158)),
                                                )))
                                            .toList()
                                      ],
                                      onChanged: (val) {}),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                'Stock account',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'From Origin',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 121, 117, 117),
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            addressNode.unfocus();
                                            areaNode.unfocus();
                                            landmarkNode.unfocus();
                                            cityNode.unfocus();
                                            zipcodeNode.unfocus();
                                            countryNode.unfocus();
                                          },
                                          child: Container(
                                              height: spc.hghtRat(0.7),
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              20))),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    spc.wdRat(0.05)),
                                                child: ListView(children: [
                                                  Row(
                                                    children: const [
                                                      Text(
                                                        'Pick any One',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: appColor),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: spc.hghtRat(0.025),
                                                  ),
                                                  for (var i = 0; i < 2; i++)
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical:
                                                            gapBetweenInputFields,
                                                      ),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                197,
                                                                223,
                                                                245),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const SizedBox(
                                                                    width: 15),
                                                                Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: const [
                                                                      SizedBox(
                                                                          height:
                                                                              8),
                                                                      Text(
                                                                        'Tony Pattichai',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              4),
                                                                      Text(
                                                                        'Los Angeles, California, USA',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w500),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              8),
                                                                    ]),
                                                                SizedBox(
                                                                  width:
                                                                      spc.wdRat(
                                                                          0.14),
                                                                ),
                                                                const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              10),
                                                                  child: Icon(
                                                                    Icons.edit,
                                                                    size: 12,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    width: 10),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: spc.hghtRat(
                                                                          0.04)),
                                                                  child: const CircleAvatar(
                                                                      radius: 12,
                                                                      backgroundColor: Colors.blue,
                                                                      child: Icon(
                                                                        Icons
                                                                            .check,
                                                                        size:
                                                                            12,
                                                                      )),
                                                                )
                                                              ]),
                                                        ),
                                                      ),
                                                    ),
                                                  Align(
                                                    child: Container(
                                                      width: spc.wdRat(0.6),
                                                      height: spc.hghtRat(0.06),
                                                      decoration: BoxDecoration(
                                                          color: const Color
                                                                  .fromARGB(
                                                              255, 3, 93, 158),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: const Text(
                                                        'SUBMIT',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                              )),
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(
                                    'Pick Your Address',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 3, 93, 158)),
                                  ),
                                ),
                              )
                            ]),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 236, 236),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        SizedBox(height: 10),
                                        Text(
                                          'Tony Pattichai',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Los Angeles, California, USA',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 10),
                                      ]),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Icon(
                                      Icons.edit,
                                      size: 18,
                                    ),
                                  )
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: boxGap),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 177, 172, 172)),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: boxShadow),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spc.wdRat(0.04),
                        vertical: spc.hghtRat(0.028)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Receiver Name & Contact Number',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 3, 93, 158),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Stack(
                          children: [
                            Container(
                              width: spc.wdRat(1),
                              height: 70,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Mr. Sundram Aryan',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: appColor),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            '+1 980 2349 789',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: appColor),
                                          ),
                                        ]),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                addressNode.unfocus();
                                                areaNode.unfocus();
                                                landmarkNode.unfocus();
                                                cityNode.unfocus();
                                                zipcodeNode.unfocus();
                                                countryNode.unfocus();
                                              },
                                              child: Container(
                                                  height: spc.hghtRat(0.7),
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      20))),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        spc.wdRat(0.05)),
                                                    child: ListView(children: [
                                                      Row(
                                                        children: const [
                                                          Text(
                                                            'Receiver Details',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    appColor),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            spc.hghtRat(0.025),
                                                      ),
                                                      TextField(
                                                        focusNode: addressNode,
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                'Stock Account',
                                                            labelText:
                                                                'Stock Account',
                                                            border: border,
                                                            enabledBorder:
                                                                border,
                                                            focusedBorder:
                                                                border),
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            gapBetweenInputFields,
                                                      ),
                                                      TextField(
                                                        focusNode: areaNode,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    'Full Name',
                                                                labelText:
                                                                    'Full Name',
                                                                border: border,
                                                                enabledBorder:
                                                                    border,
                                                                focusedBorder:
                                                                    border),
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            gapBetweenInputFields,
                                                      ),
                                                      TextField(
                                                        focusNode: landmarkNode,
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                'Mobile Number',
                                                            labelText:
                                                                'Mobile Number',
                                                            border: border,
                                                            enabledBorder:
                                                                border,
                                                            focusedBorder:
                                                                border),
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            gapBetweenInputFields,
                                                      ),
                                                      TextField(
                                                        focusNode: cityNode,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    'Email Id',
                                                                labelText:
                                                                    'Email Id',
                                                                border: border,
                                                                enabledBorder:
                                                                    border,
                                                                focusedBorder:
                                                                    border),
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            gapBetweenInputFields,
                                                      ),
                                                      TextField(
                                                        focusNode: zipcodeNode,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    'Zip Code',
                                                                labelText:
                                                                    'Zip Code',
                                                                border: border,
                                                                enabledBorder:
                                                                    border,
                                                                focusedBorder:
                                                                    border),
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            gapBetweenInputFields,
                                                      ),
                                                      TextField(
                                                        focusNode: countryNode,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    'Country',
                                                                labelText:
                                                                    'Country',
                                                                border: border,
                                                                enabledBorder:
                                                                    border,
                                                                focusedBorder:
                                                                    border),
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            spc.hghtRat(0.05),
                                                      ),
                                                      Align(
                                                        child: Container(
                                                          width: spc.wdRat(0.6),
                                                          height:
                                                              spc.hghtRat(0.06),
                                                          decoration: BoxDecoration(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  3,
                                                                  93,
                                                                  158),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          alignment:
                                                              Alignment.center,
                                                          child: const Text(
                                                            'SUBMIT',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      )
                                                    ]),
                                                  )),
                                            );
                                          },
                                        );
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        size: 30,
                                        color: appColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Shipping Address',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 121, 117, 117),
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Pick Your Address',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 3, 93, 158)),
                              )
                            ]),
                        for (var i = 0; i < 2; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 197, 223, 245),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.location_on),
                                          SizedBox(
                                            width: spc.wdRat(0.05),
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  'Tony Pattichai',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'Los Angeles, California, USA',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ]),
                                          SizedBox(
                                            width: spc.wdRat(0.14),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Icon(
                                              Icons.edit,
                                              size: 18,
                                            ),
                                          )
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: spc.hghtRat(0.03)),
                //second container
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 177, 172, 172)),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: boxShadow),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spc.wdRat(0.04),
                        vertical: spc.hghtRat(0.028)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Package Delivery Mode',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 3, 93, 158),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Stack(
                          children: [
                            Container(
                              width: spc.wdRat(1),
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 18, left: 10, right: 10),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      isExpanded: true,
                                      icon: const Icon(Icons.arrow_drop_down,
                                          color: Colors.black),
                                      items: [
                                        ...['Documents']
                                            .map((e) => DropdownMenuItem(
                                                    child: Text(
                                                  e,
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 3, 93, 158)),
                                                )))
                                            .toList()
                                      ],
                                      onChanged: (val) {}),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                'Stock account',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //fourth container
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Select Box/Cover Size',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 3, 93, 158),
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Split',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 3, 93, 158),
                                      fontWeight: FontWeight.w500),
                                ),
                                Transform.scale(
                                  scale: 0.7,
                                  child: Switch(
                                    value: switchSelectBoxSplitValue,
                                    activeColor: const Color(0xFF6200EE),
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchSelectBoxSplitValue = value;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              width: spc.wdRat(1),
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 18, left: 10, right: 10),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      isExpanded: true,
                                      icon: GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  addressNode.unfocus();
                                                  areaNode.unfocus();
                                                  landmarkNode.unfocus();
                                                  cityNode.unfocus();
                                                  zipcodeNode.unfocus();
                                                  countryNode.unfocus();
                                                },
                                                child: Container(
                                                    height: spc.hghtRat(0.7),
                                                    decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20))),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          spc.wdRat(0.05)),
                                                      child: ListView(
                                                          children: [
                                                            Row(
                                                              children: const [
                                                                Text(
                                                                  'Split Boxes',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color:
                                                                          appColor),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  spc.hghtRat(
                                                                      0.025),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                vertical:
                                                                    gapBetweenInputFields,
                                                              ),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        197,
                                                                        223,
                                                                        245),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Image.asset(
                                                                            'assets/images/box.png',
                                                                            height:
                                                                                80),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            const SizedBox(height: 10),
                                                                            const Padding(
                                                                              padding: EdgeInsets.only(bottom: 10),
                                                                              child: Text('Max Load 35 kg', style: TextStyle(fontSize: 12)),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsets.only(top: spc.hghtRat(0.04)),
                                                                              child: const CircleAvatar(
                                                                                  radius: 12,
                                                                                  backgroundColor: Colors.blue,
                                                                                  child: Icon(
                                                                                    Icons.check,
                                                                                    size: 12,
                                                                                  )),
                                                                            ),
                                                                            const SizedBox(height: 10),
                                                                          ],
                                                                        ),
                                                                      ]),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              child: Container(
                                                                width: spc
                                                                    .wdRat(0.6),
                                                                height:
                                                                    spc.hghtRat(
                                                                        0.06),
                                                                decoration: BoxDecoration(
                                                                    color: const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        3,
                                                                        93,
                                                                        158),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    const Text(
                                                                  'SUBMIT',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            )
                                                          ]),
                                                    )),
                                              );
                                            },
                                          );
                                        },
                                        child: const Icon(Icons.arrow_drop_down,
                                            color: Colors.black),
                                      ),
                                      items: [
                                        ...['Box 12x23']
                                            .map((e) => DropdownMenuItem(
                                                    child: Text(
                                                  e,
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 3, 93, 158)),
                                                )))
                                            .toList()
                                      ],
                                      onChanged: (val) {}),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                'Stock account',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: spc.hghtRat(0.03)),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 177, 172, 172)),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: boxShadow),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spc.wdRat(0.04),
                        vertical: spc.hghtRat(0.028)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Destination Split_Addr_ByPack',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 3, 93, 158),
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 0.7,
                                  child: Switch(
                                    value: switchDestinationValue,
                                    activeColor: const Color(0xFF6200EE),
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchDestinationValue = value;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: spc.hghtRat(0.03)),
                Row(
                  children: const [
                    Text(
                      'Add Package',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: spc.hghtRat(0.03)),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 177, 172, 172)),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: boxShadow),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spc.wdRat(0.04),
                        vertical: spc.hghtRat(0.028)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: spc.wdRat(1),
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 18, left: 10, right: 10),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      isExpanded: true,
                                      icon: GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  addressNode.unfocus();
                                                  areaNode.unfocus();
                                                  landmarkNode.unfocus();
                                                  cityNode.unfocus();
                                                  zipcodeNode.unfocus();
                                                  countryNode.unfocus();
                                                },
                                                child: Container(
                                                    height: spc.hghtRat(0.7),
                                                    decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20))),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          spc.wdRat(0.05)),
                                                      child: ListView(
                                                          children: [
                                                            Row(
                                                              children: const [
                                                                Text(
                                                                  'Split Boxes',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color:
                                                                          appColor),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  spc.hghtRat(
                                                                      0.025),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                vertical:
                                                                    gapBetweenInputFields,
                                                              ),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        197,
                                                                        223,
                                                                        245),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Image.asset(
                                                                            'assets/images/box.png',
                                                                            height:
                                                                                80),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            const SizedBox(height: 10),
                                                                            const Padding(
                                                                              padding: EdgeInsets.only(bottom: 10),
                                                                              child: Text('Max Load 35 kg', style: TextStyle(fontSize: 12)),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsets.only(top: spc.hghtRat(0.04)),
                                                                              child: const CircleAvatar(
                                                                                  radius: 12,
                                                                                  backgroundColor: Colors.blue,
                                                                                  child: Icon(
                                                                                    Icons.check,
                                                                                    size: 12,
                                                                                  )),
                                                                            ),
                                                                            const SizedBox(height: 10),
                                                                          ],
                                                                        ),
                                                                      ]),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              child: Container(
                                                                width: spc
                                                                    .wdRat(0.6),
                                                                height:
                                                                    spc.hghtRat(
                                                                        0.06),
                                                                decoration: BoxDecoration(
                                                                    color: const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        3,
                                                                        93,
                                                                        158),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    const Text(
                                                                  'SUBMIT',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            )
                                                          ]),
                                                    )),
                                              );
                                            },
                                          );
                                        },
                                        child: const Icon(Icons.arrow_drop_down,
                                            color: Colors.black),
                                      ),
                                      items: [
                                        ...['Box 12x23']
                                            .map((e) => DropdownMenuItem(
                                                    child: Text(
                                                  e,
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 3, 93, 158)),
                                                )))
                                            .toList()
                                      ],
                                      onChanged: (val) {}),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                'Stock account',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            addressNode.unfocus();
                                            areaNode.unfocus();
                                            landmarkNode.unfocus();
                                            cityNode.unfocus();
                                            zipcodeNode.unfocus();
                                            countryNode.unfocus();
                                          },
                                          child: Container(
                                              height: spc.hghtRat(0.7),
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              20))),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    spc.wdRat(0.05)),
                                                child: ListView(children: [
                                                  Row(
                                                    children: const [
                                                      Text(
                                                        'Pick any One',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: appColor),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: spc.hghtRat(0.025),
                                                  ),
                                                  for (var i = 0; i < 2; i++)
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical:
                                                            gapBetweenInputFields,
                                                      ),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                197,
                                                                223,
                                                                245),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const SizedBox(
                                                                    width: 15),
                                                                Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: const [
                                                                      SizedBox(
                                                                          height:
                                                                              8),
                                                                      Text(
                                                                        'Tony Pattichai',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              4),
                                                                      Text(
                                                                        'Los Angeles, California, USA',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w500),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              8),
                                                                    ]),
                                                                SizedBox(
                                                                  width:
                                                                      spc.wdRat(
                                                                          0.14),
                                                                ),
                                                                const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              10),
                                                                  child: Icon(
                                                                    Icons.edit,
                                                                    size: 12,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    width: 10),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: spc.hghtRat(
                                                                          0.04)),
                                                                  child: const CircleAvatar(
                                                                      radius: 12,
                                                                      backgroundColor: Colors.blue,
                                                                      child: Icon(
                                                                        Icons
                                                                            .check,
                                                                        size:
                                                                            12,
                                                                      )),
                                                                )
                                                              ]),
                                                        ),
                                                      ),
                                                    ),
                                                  Align(
                                                    child: Container(
                                                      width: spc.wdRat(0.6),
                                                      height: spc.hghtRat(0.06),
                                                      decoration: BoxDecoration(
                                                          color: const Color
                                                                  .fromARGB(
                                                              255, 3, 93, 158),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: const Text(
                                                        'SUBMIT',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                              )),
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(
                                    'Pick Your Address',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 3, 93, 158)),
                                  ),
                                ),
                              )
                            ]),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 236, 236),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        SizedBox(height: 10),
                                        Text(
                                          'Tony Pattichai',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Los Angeles, California, USA',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 10),
                                      ]),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Icon(
                                      Icons.edit,
                                      size: 18,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 177, 172, 172)),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: boxShadow),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: spc.wdRat(0.04),
                                  vertical: spc.hghtRat(0.028)),
                              child: Column(children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Product Info',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 121, 117, 117),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  addressNode.unfocus();
                                                  areaNode.unfocus();
                                                  landmarkNode.unfocus();
                                                  cityNode.unfocus();
                                                  zipcodeNode.unfocus();
                                                  countryNode.unfocus();
                                                },
                                                child: Container(
                                                    height: spc.hghtRat(0.7),
                                                    decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20))),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          spc.wdRat(0.05)),
                                                      child: ListView(
                                                          children: [
                                                            Row(
                                                              children: const [
                                                                Text(
                                                                  'Add Product',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color:
                                                                          appColor),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  spc.hghtRat(
                                                                      0.025),
                                                            ),
                                                            TextField(
                                                              focusNode:
                                                                  addressNode,
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      'Product Name',
                                                                  labelText:
                                                                      'Product Name',
                                                                  border:
                                                                      border,
                                                                  enabledBorder:
                                                                      border,
                                                                  focusedBorder:
                                                                      border),
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                            ),
                                                            TextField(
                                                              focusNode:
                                                                  addressNode,
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      'Product UOM',
                                                                  labelText:
                                                                      'Product UOM',
                                                                  border:
                                                                      border,
                                                                  enabledBorder:
                                                                      border,
                                                                  focusedBorder:
                                                                      border),
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                            ),
                                                            TextField(
                                                              focusNode:
                                                                  addressNode,
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      'Product Description',
                                                                  labelText:
                                                                      'Product Description',
                                                                  border:
                                                                      border,
                                                                  enabledBorder:
                                                                      border,
                                                                  focusedBorder:
                                                                      border),
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                            ),
                                                            TextField(
                                                              focusNode:
                                                                  addressNode,
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      'Qty',
                                                                  labelText:
                                                                      'Qty',
                                                                  border:
                                                                      border,
                                                                  enabledBorder:
                                                                      border,
                                                                  focusedBorder:
                                                                      border),
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                            ),
                                                            TextField(
                                                              focusNode:
                                                                  addressNode,
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      'Product Value',
                                                                  labelText:
                                                                      'Product Value',
                                                                  border:
                                                                      border,
                                                                  enabledBorder:
                                                                      border,
                                                                  focusedBorder:
                                                                      border),
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                            ),
                                                            Container(
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: const Color.fromARGB(
                                                                            255,
                                                                            177,
                                                                            172,
                                                                            172)),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          12.0),
                                                                  child: Column(
                                                                      children: [
                                                                        Row(
                                                                          children: const [
                                                                            Text('Support Bill Upload'),
                                                                          ],
                                                                        ),
                                                                        Image.asset(
                                                                            'assets/images/folder_icon.png',
                                                                            height:
                                                                                spc.hghtRat(0.2)),
                                                                      ]),
                                                                )),
                                                            Align(
                                                              child: Container(
                                                                width: spc
                                                                    .wdRat(0.6),
                                                                height:
                                                                    spc.hghtRat(
                                                                        0.06),
                                                                decoration: BoxDecoration(
                                                                    color: const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        3,
                                                                        93,
                                                                        158),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    const Text(
                                                                  'Add',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            )
                                                          ]),
                                                    )),
                                              );
                                            },
                                          );
                                        },
                                        child: const Text(
                                          'Add',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  255, 3, 93, 158)),
                                        ),
                                      )
                                    ]),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 238, 236, 236),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 8),
                                    child: Column(
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    SizedBox(height: 10),
                                                    Text(
                                                      'Dark Compound',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Text(
                                                      'Qty 36',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(height: 10),
                                                  ]),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Icon(
                                                Icons.edit,
                                                size: 18,
                                              ),
                                              const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 18,
                                              )
                                            ]),
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: spc.hghtRat(0.03)),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 177, 172, 172)),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: boxShadow),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spc.wdRat(0.04),
                        vertical: spc.hghtRat(0.028)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Self Drop Off',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 3, 93, 158),
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 0.7,
                                  child: Switch(
                                    value: switchSelfDropValue,
                                    activeColor: const Color(0xFF6200EE),
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchSelfDropValue = value;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: spc.hghtRat(0.03)),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        addressNode.unfocus();
                                        areaNode.unfocus();
                                        landmarkNode.unfocus();
                                        cityNode.unfocus();
                                        zipcodeNode.unfocus();
                                        countryNode.unfocus();
                                      },
                                      child: Container(
                                          height: spc.hghtRat(0.7),
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(20))),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(spc.wdRat(0.05)),
                                            child: ListView(children: [
                                              Row(
                                                children: const [
                                                  Text(
                                                    'Nearest Drop Point',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: appColor),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: spc.hghtRat(0.025),
                                              ),
                                              for (var i = 0; i < 2; i++)
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        gapBetweenInputFields,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 197, 223, 245),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const SizedBox(
                                                                width: 15),
                                                            Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: const [
                                                                  SizedBox(
                                                                      height:
                                                                          8),
                                                                  Text(
                                                                    'Tony Pattichai',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          4),
                                                                  Text(
                                                                    'Los Angeles, California, USA',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          8),
                                                                ]),
                                                            SizedBox(
                                                              width: spc
                                                                  .wdRat(0.14),
                                                            ),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          10),
                                                              child: Icon(
                                                                Icons.edit,
                                                                size: 12,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  top: spc
                                                                      .hghtRat(
                                                                          0.04)),
                                                              child:
                                                                  const CircleAvatar(
                                                                      radius:
                                                                          12,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .blue,
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check,
                                                                        size:
                                                                            12,
                                                                      )),
                                                            )
                                                          ]),
                                                    ),
                                                  ),
                                                ),
                                              Align(
                                                child: Container(
                                                  width: spc.wdRat(0.6),
                                                  height: spc.hghtRat(0.06),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 3, 93, 158),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    'SUBMIT',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )
                                            ]),
                                          )),
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                'Select Nearest Hub Point',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: spc.hghtRat(0.03)),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 236, 236),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(height: 10),
                                Text(
                                  'Tony Pattichai',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Los Angeles, California, USA',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10),
                              ]),
                          const SizedBox(
                            width: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Icon(
                              Icons.edit,
                              size: 18,
                            ),
                          )
                        ]),
                  ),
                ),
                SizedBox(height: spc.hghtRat(0.03)),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: const Color.fromARGB(255, 177, 172, 172)),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: boxShadow),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: spc.wdRat(0.04),
                      ),
                      child: Column(children: [
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Package Summary',
                                style: TextStyle(
                                    color: appColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                        SizedBox(height: spc.hghtRat(0.02)),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 197, 223, 245)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 226, 221, 221),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              const Text(
                                                'Rate Per Kg',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(width: spc.wdRat(0.2)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        '965.00',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(height: spc.hghtRat(0.02)),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 197, 223, 245)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 226, 221, 221),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              const Text(
                                                'GST Tax 18%',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(width: spc.wdRat(0.2)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        '965.00',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(height: spc.hghtRat(0.02)),
                          ],
                        ),
                      ]),
                    )),
                SizedBox(height: spc.hghtRat(0.03)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Save & Book Later',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 3, 93, 158),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: spc.hghtRat(0.1)),
              ]),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Transform.scale(
                  scale: 0.9,
                  child: SwipeableButtonView(
                    buttonText: 'Pay and Book now 2,389.00',
                    buttontextstyle:
                        TextStyle(fontSize: 16, color: Colors.white),
                    buttonWidget: Container(
                      child: Text(
                        '₹',
                        style: TextStyle(fontSize: 28, color: Colors.grey),
                      ),
                    ),
                    activeColor: appColor,
                    isFinished: isFinished,
                    onWaitingProcess: () {
                      setState(() {
                        isFinished = true;
                      });
                    },
                    onFinish: () async {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
