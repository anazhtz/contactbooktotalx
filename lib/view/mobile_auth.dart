import 'package:contactbooktotalx/view/otp_page.dart';
import 'package:contactbooktotalx/widgets/custom_button.dart';
import 'package:contactbooktotalx/widgets/custom_terms_text.dart';
import 'package:contactbooktotalx/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:contactbooktotalx/constand/app_color.dart';
import 'package:contactbooktotalx/constand/app_fonts.dart';
import 'package:contactbooktotalx/utilis/responsive.dart';

class MobileAuth extends StatefulWidget {
  const MobileAuth({super.key});

  @override
  State<MobileAuth> createState() => _MobileAuthState();
}

class _MobileAuthState extends State<MobileAuth> {
  final FocusNode _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your number';
    } else if (value.length != 10) {
      return 'Please enter a 10-digit number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context: context);

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(4)),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/OBJECTS.png",
                      width: responsive.wp(60),
                      height: responsive.wp(60),
                    ),
                  ),
                  SizedBox(height: responsive.hp(0.5)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter Phone Number",
                      style: AppTypography.montserratSemiBold.copyWith(
                        fontSize: responsive.sp(16),
                      ),
                    ),
                  ),
                  SizedBox(height: responsive.hp(1.5)),
                  PhoneNumberField(
                    focusNode: _focusNode,
                    validator: validatePhoneNumber,
                    responsive: responsive,
                  ),
                  SizedBox(height: responsive.hp(3)),
                  TermsConditionText(
                    responsive: responsive,
                    mainTextColor: Colors.black.withOpacity(0.4),
                    mainText: 'By Continuing, I agree to TotalX\'s ',
                    linkTexts: [
                      LinkText(
                          text: 'Terms and condition',
                          color: AppColors.filterSelect),
                      LinkText(
                          text: ' & ', color: Colors.black.withOpacity(0.4)),
                      LinkText(
                          text: 'privacy policy',
                          color: AppColors.filterSelect),
                    ],
                  ),
                  SizedBox(height: responsive.hp(4)),
                  SizedBox(
                    width: double.infinity,
                    child: SubmitButton(
                      formKey: _formKey,
                      responsive: responsive,
                      buttonText: 'Get OTP',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OTPScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
