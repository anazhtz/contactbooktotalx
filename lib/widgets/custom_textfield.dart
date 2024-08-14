import 'package:contactbooktotalx/constand/app_fonts.dart';
import 'package:contactbooktotalx/utilis/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberField extends StatelessWidget {
  final FocusNode focusNode;
  final String? Function(String?) validator;
  final Responsive responsive;

  const PhoneNumberField({
    super.key,
    required this.focusNode,
    required this.validator,
    required this.responsive,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          style: AppTypography.montserratRegular.copyWith(
            fontSize: responsive.sp(15),
            color: Colors.black.withOpacity(0.7),
          ),
          decoration: InputDecoration(
            hintText: 'Enter Phone Number',
            hintStyle: AppTypography.montserratRegular.copyWith(
              fontSize: responsive.sp(15),
              color: Colors.black.withOpacity(0.4),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(responsive.wp(2)),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(responsive.wp(2)),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(responsive.wp(2)),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(responsive.wp(2)),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          validator: validator,
        ),
        if (!focusNode.hasFocus)
          Positioned(
            right: 190,
            top: 10,
            child: Padding(
              padding: EdgeInsets.all(responsive.wp(1)),
              child: Text(
                '*',
                style: AppTypography.montserratRegular.copyWith(
                  fontSize: responsive.sp(15),
                  color: Colors.red,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
