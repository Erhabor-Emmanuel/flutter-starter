import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../const/strings.dart';
import '../../const/styles.dart';
import '../home screen/home.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        backgroundColor: kWhite,
        tabBar: CupertinoTabBar(
          backgroundColor: kScaffoldBackground,
          items:  const <BottomNavigationBarItem>[
            BottomNavigationBarItem(label: Strings.home, icon: Icon(Icons.home_filled, size: 24,color: Colors.grey,), activeIcon: Icon(Icons.home_filled, color: kBlack,)),
            BottomNavigationBarItem(label: Strings.spend, icon: Icon(Icons.credit_card, size: 24, color: Colors.grey), activeIcon:Icon(Icons.credit_card,color: kBlack,), ),
            BottomNavigationBarItem(label: Strings.save, icon:  Icon(Icons.work, size: 24,color: Colors.grey,),activeIcon:Icon(Icons.work, color: kBlack,),),
            BottomNavigationBarItem(label: Strings.borrow, icon:  Icon(Icons.work, size: 24,color: Colors.grey,),activeIcon:Icon(Icons.work, color: kBlack,),),
            BottomNavigationBarItem(label: Strings.more, icon:  Icon(Icons.more_horiz_rounded, size: 24,color: Colors.grey,),activeIcon:Icon(Icons.work, color: kBlack,),)
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return  const CupertinoPageScaffold(
                    child: HomeScreen(),
                    backgroundColor: kWhite,
                  );
                },
              );

            default:
              return const HomeScreen();
          }
        });
  }
}