import 'package:flutter/material.dart';
import 'package:flutter_assesment/const/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/strings.dart';
import '../../utils/password strenght field/src/fancy_password_field.dart';
import '../../utils/password strenght field/src/validation_rule.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isVisible = false;
  bool? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.arrow_back, color: kBlack),
        ),
        backgroundColor: kSignup,
        elevation: 0,
      ),
      backgroundColor: kSignup,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 15.0.r, left: 15.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //ToDo: remember to give property
              Text(Strings.createAccount, style: kCreateAccount),
              SizedBox(height: 10.h),
              Text(Strings.detail, style: kDetailAccount),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 11.0.r),
                    child: Expanded(
                        child: CustomTextField(
                            text: Strings.firstName, styleText: kFirstN)),
                  ),
                  Expanded(
                      child: CustomTextField(
                          text: Strings.Surname, styleText: kFirstN)),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              EmailWidget(
                text: Strings.email,
                hText: Strings.hText,
              ),
              SizedBox(
                height: 22.h,
              ),
              Text('Create Password', style: kFirstN),
              SizedBox(
                height: 7.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 108.0.r),
                child: FancyPasswordField(
                  validationRules: {
                    MinCharactersValidationRule(4),
                    LowercaseValidationRule(),
                    DigitValidationRule(),
                    UppercaseValidationRule(),
                    SpecialCharacterValidationRule(),
                  },
                  strengthIndicatorBuilder: (strength) => const Text(
                    '',
                  ),
                  obscureText: !_isVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: _isVisible
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                    ),
                    fillColor: kWhite,
                    hintText: Strings.hPassword,
                    // contentPadding: EdgeInsets.symmetric(vertical: 48.0.h, horizontal: 167.0.w),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kBlack),
                      borderRadius: BorderRadius.circular(12.0.r),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(value: this.value, onChanged: (bool? value){
                    setState(() {
                       this.value = value!;
                       print(value);
                    });
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EmailWidget extends StatelessWidget {
  final String text;
  final String hText;
  const EmailWidget({
    required this.text,
    required this.hText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(
          height: 7.h,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 48.h,
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: kWhite,
              hintText: hText,
              // contentPadding: EdgeInsets.symmetric(vertical: 48.0.h, horizontal: 167.0.w),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kBlack),
                borderRadius: BorderRadius.circular(12.0.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  String text;
  TextStyle styleText;

  CustomTextField({
    required this.text,
    required this.styleText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(
          height: 7.h,
        ),
        SizedBox(
          width: 167.w,
          height: 49.h,
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: kWhite,
              hintText: text,
              // contentPadding: EdgeInsets.symmetric(vertical: 48.0.h, horizontal: 167.0.w),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kBlack),
                borderRadius: BorderRadius.circular(12.0.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
