
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/styles.dart';

class CardTextIcon extends StatelessWidget {
  final String? label;
  final Widget? widget;
  const CardTextIcon({
    Key? key,
    required this.label,
    required this.widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Padding(
          padding:  EdgeInsets.only( right: 8.0.r),
          child: Text(label!,
            style: kCardTextIconStyle,),
        ),
        widget!

      ],
    );
  }
}