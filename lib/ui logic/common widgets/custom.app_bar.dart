import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/strings.dart';
import '../../const/styles.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  final Size preferredSize;
  const CustomAppBar({
    Key? key,
  }) : preferredSize = const Size.fromHeight(50), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation:0.0,
      backgroundColor: kScaffoldBackground,
      title: Text(Strings.appBarTitle,
        style: kAppBarStyle,),
      actions: [IconButton(onPressed: (){}, icon: Stack(
        children:   const [
          Icon(Icons.notifications, color: kBlack, size: 25,),
          Positioned(
              top: 5,
              left: 15,
              child: CircleAvatar(radius: 3, backgroundColor: Colors.red,))
        ],
      )),
        IconButton(onPressed: (){}, icon: const Icon(Icons.person, color: kBlack, size: 25,))],
    );
  }
}