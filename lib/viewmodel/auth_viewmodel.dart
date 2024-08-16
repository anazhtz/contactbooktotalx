import 'dart:developer';

import 'package:contactbooktotalx/view/homepage.dart';
import 'package:contactbooktotalx/view/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MobileAuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  String? get verificationId => _verificationId;

  Future<void> verifyPhoneNumber(String phoneNumber, BuildContext context) async {
    log('+91$phoneNumber');
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Verification failed. Please try again.')),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          notifyListeners();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OTPScreen(),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    if (_verificationId != null) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId!,
          smsCode: otp,
        );

        UserCredential userCredential = await _auth.signInWithCredential(credential);

        if (userCredential.user != null) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>  HomePage()),
            (Route<dynamic> route) => false,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User credential is null.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid OTP. Error: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Verification ID is null.')),
      );
    }
  }
}
