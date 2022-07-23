import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/styles.dart';

class CardActionButton extends StatelessWidget {
  final String? label;
  final Color? color;
  final bool? isDarkBackground;
  const CardActionButton({
    required this.label,
    required this.color,
    required this.isDarkBackground,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: color!,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(label!, style: isDarkBackground! ?
      kCardActionWhiteStyle :
      kCardActionGreyStyle,)),
    );
  }
}