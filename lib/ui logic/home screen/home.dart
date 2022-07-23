import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/strings.dart';
import '../../const/styles.dart';
import '../common widgets/card.action_button.dart';
import '../common widgets/card.text_icon.dart';
import '../common widgets/custom.app_bar.dart';
import '../common widgets/toogle.switch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kScaffoldBackground,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.r, right: 10.r),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 10,
                height: 260.h,
                child: Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: kWhite,
                  child: Padding(
                    padding: EdgeInsets.only(top: 4.0.r, left: 16.0.r, right: 16.0.r),
                    child: Column(
                      children:     <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            CardTextIcon(label: Strings.goodMorning, widget: Icon(Icons.cloud, size: 18, color: kBlack,),),
                            CardTextIcon(label: Strings.hideBalance, widget: SwitchToggle())
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 24.0.r),
                          child: Container(
                            alignment: Alignment.centerLeft,
                              child: Text("\u{20A6}${Strings.balance}", style: kAppBarStyle,),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            CardActionButton(label: Strings.transfer, color: kScaffoldBackground, isDarkBackground: false,),
                            CardActionButton(label: Strings.addMoney, color: kBlack, isDarkBackground: true,)
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 32.0.r),
                          child: Container(
                            width: 320.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              color: kDarkBlue,
                              borderRadius: BorderRadius.circular(24)
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(top:12.r, left: 12.r, right: 12.r, bottom: 8.r),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(Strings.finishAccountSetup, style: kBlueTextStyle,),
                                      const Icon(Icons.arrow_forward_ios_sharp, size: 14, color: Colors.grey,)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 12.0.r),
                                  child: Container(alignment: Alignment.centerLeft,child: Text(Strings.finishAccountSetupSub, style: kBlueTextLightStyle,)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0.r, bottom: 16.0.r),
                child: Row(
                  children: const [
                      QuickTransactions(label: Strings.quickActions,color: kWhite, isWhiteBackground: true,),
                    QuickTransactions(label: Strings.transactions,color: kScaffoldBackground, isWhiteBackground: false,),
                  ],
                ),
              ),
             const Expanded(child: CustomGrid())
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? bottomLabel;
  final IconData? icon;
  final Color? iconColor, backgroundColor, avatarColor;
  final TextStyle? subTextStyle;
  final TextStyle? bottomLabelTextStyle;
  const TransactionCard({
    required this.title,
    required this.subTitle,
    required this.bottomLabel,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.avatarColor,
    required this.subTextStyle,
    required this.bottomLabelTextStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.r),
      child: Container(
        height: 200.h,
        width: 178.w,
        decoration: BoxDecoration(
            color:backgroundColor!,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding:  EdgeInsets.all(18.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(child: Icon(icon!, color: iconColor!, size: 18,), radius: 15,
                  backgroundColor: avatarColor!,),
                   SizedBox(width: 10.w),
                  Text(title!, style: kBorrowCard,),
                ],
              ),
               SizedBox(height: 20.h),
              Text(subTitle!, style: subTextStyle!),
               SizedBox(height: 40.h),
              Text(bottomLabel!, style: bottomLabelTextStyle!),
            ],
          ),
        ),
      ),
    );
  }
}

class QuickTransactions extends StatelessWidget {
  final String? label;
  final Color? color;
  final bool? isWhiteBackground;
  const QuickTransactions({
    Key? key,
    required this.label,
    required this.color,
    required this.isWhiteBackground
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120.r,
      height: 35.r,
      decoration: BoxDecoration(
        color: color!,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(label!, style: isWhiteBackground! ? kBlackTextStyle : kCardActionGreyStyle,),
    );
  }
}


class CustomGrid extends StatelessWidget {
  const CustomGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.5;
    final double itemWidth = size.width /2;
    return GridView.count(

        crossAxisCount: 2,
      primary: true,
      physics: const BouncingScrollPhysics(),
      childAspectRatio: (itemWidth/itemHeight),
      mainAxisSpacing: 3.0.r,
      crossAxisSpacing: 3.0.r,
      children: <Widget> [
        TransactionCard(title: Strings.borrow, subTitle: Strings.loanText, bottomLabel: Strings.view, icon: Icons.work,iconColor: Colors.amber.shade800, backgroundColor: kLightYellow,subTextStyle: kLoanText,bottomLabelTextStyle: kViewOffer, avatarColor: Colors.amber.shade200,),
        TransactionCard(title: Strings.save, subTitle: Strings.saveSub, bottomLabel: Strings.start, icon: Icons.work,iconColor: Colors.greenAccent.shade700, backgroundColor: kLightGreen,subTextStyle: kSaveText,bottomLabelTextStyle: kViewOffer, avatarColor: Colors.greenAccent.shade200,),
        TransactionCard(title: Strings.spend, subTitle: Strings.spendSub, bottomLabel: Strings.spend, icon: Icons.work,iconColor: Colors.redAccent.shade700, backgroundColor: kLightRed,subTextStyle: kSpend,bottomLabelTextStyle: kViewOffer, avatarColor: Colors.redAccent.shade100,),
        TransactionCard(title: Strings.invest, subTitle: Strings.investSub, bottomLabel: Strings.invest, icon: Icons.work,iconColor: Colors.blueAccent.shade700, backgroundColor: kDarkBlue,subTextStyle: kInvest,bottomLabelTextStyle: kViewOffer, avatarColor: Colors.blueAccent.shade100,),

      ],
    );
  }
}




