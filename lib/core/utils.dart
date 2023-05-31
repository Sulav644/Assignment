import 'package:flutter/material.dart';

class Space {
  final BuildContext context;
  Space({required this.context});
  double wdRat(double rat) => MediaQuery.of(context).size.width * rat;
  double hghtRat(double rat) => MediaQuery.of(context).size.height * rat;
}

class Components {
  final appBar = AppBar(
    toolbarHeight: 0,
    backgroundColor: Colors.white,
    elevation: 0,
  );
}
