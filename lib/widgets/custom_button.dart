import 'package:flutter/material.dart';
import 'package:contactbooktotalx/constand/app_color.dart';
import 'package:contactbooktotalx/constand/app_fonts.dart';
import 'package:contactbooktotalx/utilis/responsive.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.responsive,
    required this.buttonText,
    required this.onTap,
    this.isLoading = false,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final Responsive responsive;
  final String buttonText;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () {
              if (_formKey.currentState?.validate() ?? false) {
                onTap();
              }
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(responsive.wp(8)),
        ),
      ),
      child: isLoading
          ? SizedBox(
              height: responsive.hp(2),
              width: responsive.hp(2),
              child: CircularProgressIndicator(
                color: AppColors.secondaryColor,
                strokeWidth: 2.0,
              ),
            )
          : Text(
              buttonText,
              style: AppTypography.montserratSemiBold.copyWith(
                color: AppColors.secondaryColor,
                fontSize: responsive.sp(16),
              ),
            ),
    );
  }
}
