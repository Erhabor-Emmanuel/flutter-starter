

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assesment/const/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../const/strings.dart';
import '../on boarding/onboarding.dart';

class OTPScreen extends StatefulWidget {
  final String? formattedPhone;
  const OTPScreen({Key? key, this.formattedPhone}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreen();
}

class _OTPScreen extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    StreamController<ErrorAnimationType>? errorController;
    TextEditingController textEditingController = TextEditingController();

    String? currentText;
    return Scaffold(
        backgroundColor: kSignup,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kSignup,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 96.0.r, left: 16.0.r, right: 16.0.r),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                      EdgeInsets.only(left: 59.r, right: 59.r, bottom: 8.0.r),
                      child: AutoSizeText(
                        Strings.otp,
                        style: kFirstN,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 64.r, right: 64.r, bottom: 32.r),
                      child: AutoSizeText(
                        " ${Strings.resetCodeSub}${widget.formattedPhone}",
                        style: kFirstN,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 24.r),
                      child: Padding(
                        padding: EdgeInsets.only(left: 32.r, right: 32.r),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: const TextStyle(
                            color: kLightGreen,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 4,
                          obscureText: false,
                          obscuringCharacter: '*',
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 3) {
                              return Strings.otpError;
                            } else {
                              return null;
                            }
                          },
                          pinTheme: kPinCodeStyle,
                          animationDuration: const Duration(milliseconds: 300),
                          textStyle: kPinCodeTextStyle,
                          enableActiveFill: false,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          boxShadows: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10.r,
                            )
                          ],
                          onCompleted: (v) async {
                           //ToDO: Put what you want to happen after it is done
                            debugPrint("Completed $v");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value){
                            debugPrint("Value ===> $value");
                            setState(()  {
                              currentText = value;

                            });
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            return true;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.r),
                      child: BlackAuthButton(
                        label: Strings.confirm2,
                        onPressed: () async {
                          //Todo: Do Create Username
                          Navigator.pushNamed(context, '/SignUpScreen');
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          Strings.noCode1,
                          style: kFirstN,
                          maxLines: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            //ToDo: Resend Code
                          },
                          child: AutoSizeText(
                            Strings.noCode2,
                            style: kFirstN,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
      );
  }
}