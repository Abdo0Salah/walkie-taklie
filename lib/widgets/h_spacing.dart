import 'package:flutter/material.dart';


import '../utils/utils.dart';

class HSpacing extends StatelessWidget {
  final double percentage;
  const HSpacing(this.percentage, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: mqWidth(context, percentage),
    );
  }
}