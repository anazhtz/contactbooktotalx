import 'package:contactbooktotalx/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contactbooktotalx/widgets/custom_button.dart';
import 'package:contactbooktotalx/widgets/custom_terms_text.dart';
import 'package:contactbooktotalx/constand/app_color.dart';
import 'package:contactbooktotalx/constand/app_fonts.dart';
import 'package:contactbooktotalx/utilis/responsive.dart';


class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int _timer = 59;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _otpController1;
  late TextEditingController _otpController2;
  late TextEditingController _otpController3;
  late TextEditingController _otpController4;
  late TextEditingController _otpController5;
  late TextEditingController _otpController6;

  @override
  void initState() {
    super.initState();
    _otpController1 = TextEditingController();
    _otpController2 = TextEditingController();
    _otpController3 = TextEditingController();
    _otpController4 = TextEditingController();
    _otpController5 = TextEditingController();
    _otpController6 = TextEditingController();
    startTimer();
  }

 void startTimer() {
  Future.delayed(const Duration(seconds: 1), () {
    if (_timer > 0) {
      setState(() {
        _timer--;
      });
      startTimer();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                'Timeout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  });
}


  @override
  void dispose() {
    _otpController1.dispose();
    _otpController2.dispose();
    _otpController3.dispose();
    _otpController4.dispose();
    _otpController5.dispose();
    _otpController6.dispose();
    super.dispose();
  }

  String? _validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP';
    }
    if (value.length != 1) {
      return 'Enter a single digit';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context: context);

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(responsive.wp(4)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: responsive.hp(2)),
                  child: Image.asset(
                    'assets/images/Group (1).png',
                    width: responsive.wp(50),
                  ),
                ),
              ),
              Text(
                'OTP Verification',
                style: AppTypography.montserratSemiBold.copyWith(
                  fontSize: responsive.sp(20),
                ),
              ),
              SizedBox(height: responsive.hp(1)),
              Text(
                'Enter the verification code we just sent to your number +91 ******21.',
                style: AppTypography.montserratRegular.copyWith(
                  fontSize: responsive.sp(14),
                ),
              ),
              SizedBox(height: responsive.hp(2)),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildOTPTextField(_otpController1, responsive),
                    _buildOTPTextField(_otpController2, responsive),
                    _buildOTPTextField(_otpController3, responsive),
                    _buildOTPTextField(_otpController4, responsive),
                    _buildOTPTextField(_otpController5, responsive),
                    _buildOTPTextField(_otpController6, responsive),
                  ],
                ),
              ),
              SizedBox(height: responsive.hp(1)),
              Center(
                child: Text(
                  '$_timer Sec',
                  style: AppTypography.montserratSemiBold.copyWith(
                    color: Colors.red,
                    fontSize: responsive.sp(16),
                  ),
                ),
              ),
              SizedBox(height: responsive.hp(2)),
              Center(
                child: TermsConditionText(
                  mainTextColor: AppColors.hintColor2,
                  responsive: responsive,
                  mainText: 'Didn\'t get OTP? ',
                  linkTexts: [
                    LinkText(text: 'Resend', color: AppColors.filterSelect),
                  ],
                ),
              ),
              SizedBox(height: responsive.hp(2)),
              SizedBox(
                width: double.infinity,
                child: SubmitButton(
                  formKey: _formKey,
                  responsive: responsive,
                  buttonText: 'Verify',
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserListPage()),
                  );
                }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPTextField(
      TextEditingController controller, Responsive responsive) {
    return SizedBox(
      width: responsive.wp(12),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: const TextStyle(
          color: Colors.red,
        ),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          counterText: '',
        ),
        validator: _validateOTP,
      ),
    );
  }
}
