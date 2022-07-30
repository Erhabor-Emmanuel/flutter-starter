import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/assets.dart';
import '../../../const/strings.dart';
import '../../../const/styles.dart';

class OnBoardingScreens extends StatefulWidget {
  final List<Widget> pageViewChildren = <Widget>[
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
   // const GettingStartedScreen(),
  ];

   OnBoardingScreens({Key? key}) : super(key: key);
  @override
  _OnBoardingScreensState createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int numberOfPages = 4;
  int i = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {});
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (i = 0; i < numberOfPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 4.0.h : 8.0.h,
      width: isActive ? 20.0.h : 8.0.w,
      decoration: BoxDecoration(
          color: isActive ? kDarkBlue : kDetail,
          borderRadius: BorderRadius.all(Radius.circular(200.r))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      _currentPage == numberOfPages - 1 ? Colors.transparent : Colors.white,
      body: SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.0.w),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 600.h,
                      child: PageView(
                        physics: const ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: widget.pageViewChildren,
                      ),
                    ),
                  ],
                ),
              ),
              _currentPage != numberOfPages - 1
                  ? Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 72.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 100.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: _buildPageIndicator(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.0.r),
                                topRight: Radius.circular(20.0.r),
                                bottomLeft: Radius.circular(0.0.r),
                                bottomRight: Radius.circular(20.0.r),
                              ),
                            ),
                            child: SizedBox(
                              width: 80.w,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/HomeScreen');
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            EdgeInsets.all(8.0.w),
                                            child: Text(
                                              Strings.skip,
                                              style: kOnboardingSkip,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 16.0.r, left: 164.0.r),
                            child: Container(
                              height: 40.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                gradient:  const LinearGradient(
                                  colors: <Color>[
                                    Colors.greenAccent,
                                    kDarkBlue,
                                  ],
                                ),
                                color: const Color(0XFF2D5FAA),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0.r),
                                  topRight: Radius.circular(15.0.r),
                                  bottomLeft: Radius.circular(15.0.r),
                                  bottomRight: Radius.circular(15.0.r),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration:
                                    const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0.w),
                                      child: Text(Strings.next,
                                        style: TextStyle(
                                          color: kWhite,
                                          fontSize: 16.0.sp,
                                        ),),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Icon(Icons.arrow_forward,
                                        color: kWhite, size: 20.0.sp)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
                  : Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0.w),
                      child: BlackAuthButton(
                        label: Strings.getStarted,
                        onPressed: () {
                          Navigator.pushNamed(context, '/HomeScreen');
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0.w),
                      child: BlackAuthButton(
                        label: Strings.getStarted,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context,
                             '/HomeScreen');
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0.w, 50.w, 16.w, 0.w),
      child: SizedBox(
        height: 700.h,
        child: Stack(
          children: [
            Positioned(
              top: 90,
              bottom: 150,
              left: 20,
              right: 20,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                            child: Image.asset(
                              Assets.onBoardingImage1,
                            )),
                      ),
                      SizedBox(
                        height: 60.0.h,
                      ),
                      Center(
                        child: Text(
                          //ToDo: this is where the Heading  on corresponding style of the 3rd onBoarding goes
                          Strings.onBoardingTitle3,
                          style: kFirstN,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0.w, 8.w, 0.w, 0.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(Strings.onBoardingString3,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: kFirstN),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0.w, 50.w, 16.w, 0.w),
      child: SizedBox(
        height: 700.h,
        child: Stack(
          children: [
            Positioned(
              top: 90,
              bottom: 150,
              left: 20,
              right: 20,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Image.asset(
                            Assets.onBoardingImage1,
                          )),
                      SizedBox(
                        height: 60.0.h,
                      ),
                      Center(
                        child: Text(
                          Strings.onBoardingTitle2,
                          style: kFirstN,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0.w, 8.w, 0.w, 0.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(Strings.onBoardingString2,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: kFirstN),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0.w, 50.w, 16.w, 0.w),
      child: SizedBox(
        height: 700.h,
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: 90,
                bottom: 150,
                left: 20,
                right: 20,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                              child: Image.asset(
                                Assets.onBoardingImage1,
                              )),
                        ),
                        SizedBox(
                          height: 55.0.h,
                        ),
                        Center(
                          child: Text(
                            Strings.onBoardingTitle1,
                            style: kFirstN,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0.w, 8.w, 0.w, 0.w),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(Strings.onBoardingString1,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: kFirstN),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlackAuthButton extends StatelessWidget {
  final String? label;
  final VoidCallback onPressed;
  const BlackAuthButton({
    Key? key,
    required this.label, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child:  Text(
      label!,
      style: kAuthButtonTextStyle,
      maxLines: 1,
    ),
      style: kAuth,);
  }
}