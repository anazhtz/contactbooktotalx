import 'package:flutter/material.dart';
import 'package:contactbooktotalx/constand/app_fonts.dart';
import 'package:contactbooktotalx/utilis/responsive.dart';

class TermsConditionText extends StatelessWidget {
  const TermsConditionText({
    super.key,
    required this.responsive,
    required this.mainText,
    required this.mainTextColor,
    required this.linkTexts,
  });

  final Responsive responsive;
  final String mainText;
  final Color mainTextColor;
  final List<LinkText> linkTexts;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: mainText,
        style: AppTypography.montserratSemiBold.copyWith(
          fontSize: responsive.sp(13),
          color: mainTextColor,
        ),
        children: linkTexts.map((linkText) {
          return TextSpan(
            text: linkText.text,
            style: AppTypography.montserratSemiBold.copyWith(
              fontSize: responsive.sp(13),
              color: linkText.color,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class LinkText {
  final String text;
  final Color color;

  LinkText({required this.text, required this.color});
}
