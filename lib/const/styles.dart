import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color kLightGreen = Color(0xffE0F3EF);
const Color kSignup = Color(0xffECECEC);
const Color kCardBlue = Color(0xffCEE2FD);
const Color kDarkBlueT = Color(0xffAABFDC);
const Color kDarkBlue = Color(0xffCEE2FD);
const Color kLightRed = Color(0xffF6E8ED);
const Color kDarkBlueT2 = Color(0xff8295B5);
const Color kScaffoldBackground = Color(0xffF6F6FB);
const Color kBlack = Color(0xff000000);
const Color kWhite = Color(0xffffffff);
const Color kLightYellow = Color(0xffFCF4E9);
const Color kCreate = Color(0xff14121E);
const Color kDetail = Color(0xff8F9BB3);
const Color kFirst = Color(0xff222B45);
const Color kSplashBackground = Color(0xffF4F6FB);




TextStyle kAppBarStyle = GoogleFonts.roboto(
  color: kBlack,
  fontSize: 25.sp,
  fontWeight: FontWeight.bold,
);

TextStyle kCardTextIconStyle = GoogleFonts.roboto(
  fontSize: 12.sp,
  color: Colors.grey,
  fontWeight: FontWeight.w400
);

TextStyle kCardActionGreyStyle = GoogleFonts.roboto(
    fontSize: 14.sp,
    color: Colors.grey,
    fontWeight: FontWeight.w400
);



TextStyle kCardActionWhiteStyle = GoogleFonts.roboto(
    fontSize: 14.sp,
    color: kWhite,
    fontWeight: FontWeight.w400
);

TextStyle kBlueTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.bold,
  color: Colors.lightBlue.shade900,
  fontSize: 14.sp
);
TextStyle kBlackTextStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    color: kBlack,
    fontSize: 14.sp
);

TextStyle kBlueTextLightStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    color: Colors.lightBlue.shade900,
    fontSize: 14.sp
);

TextStyle kBorrowCard = GoogleFonts.roboto(
    fontSize: 25.sp,
    color: kBlack,
    fontWeight: FontWeight.bold
);

TextStyle kLoanText= GoogleFonts.roboto(
    fontSize: 14.sp,
    color: Colors.amber.shade400,
    fontWeight: FontWeight.w400
);
TextStyle kViewOffer= GoogleFonts.roboto(
    fontSize: 14.sp,
    color: kBlack,
    fontWeight: FontWeight.bold
);

TextStyle kSaveText= GoogleFonts.roboto(
fontSize: 14.sp,
color: Colors.greenAccent.shade700,
fontWeight: FontWeight.w400
);
TextStyle kSpend= GoogleFonts.roboto(
    fontSize: 14.sp,
    color: Colors.redAccent.shade700,
    fontWeight: FontWeight.w400
);

TextStyle kInvest= GoogleFonts.roboto(
    fontSize: 14.sp,
    color: Colors.blueAccent.shade700,
    fontWeight: FontWeight.w400
);

TextStyle kCreateAccount = GoogleFonts.inter(
  fontSize: 25.sp,
  color: kCreate,
  fontWeight: FontWeight.w700
);

TextStyle kDetailAccount = GoogleFonts.inter(
  fontSize: 14.sp,
  color: kDetail,
  fontWeight: FontWeight.w500
);

TextStyle kFirstN = GoogleFonts.inter(
    fontSize: 14.sp,
    color: kFirst,
    fontWeight: FontWeight.w500
);

TextStyle kOnboardingSkip = GoogleFonts.inter(
    fontSize: 12.sp,
    color: kBlack,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
);


TextStyle kAuthButtonTextStyle = GoogleFonts.roboto(
  fontStyle: FontStyle.normal,
  fontSize: 14.sp,
  fontWeight: FontWeight.w500,
  color: kWhite,
);

ButtonStyle kAuth = TextButton.styleFrom(
  primary: Colors.transparent,
  fixedSize: const Size(353, 50),
  backgroundColor: kBlack,
  shape: const RoundedRectangleBorder(
    // side: BorderSide(color: kBlackText, width: 2),
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
  ),
);