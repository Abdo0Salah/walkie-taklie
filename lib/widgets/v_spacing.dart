import 'package:flutter/material.dart';
import '../utils/utils.dart';

class VSpacing extends StatelessWidget {
  final double percentage;
  const VSpacing(this.percentage, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mqHeigth(context, percentage),
    );
  }
}
