import 'package:contactbooktotalx/constand/app_color.dart';
import 'package:contactbooktotalx/constand/app_fonts.dart';
import 'package:contactbooktotalx/utilis/responsive.dart';
import 'package:flutter/material.dart';

class CustomSearchFiled extends StatelessWidget {
  const CustomSearchFiled({
    super.key,
    required this.responsive,
  });

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: responsive.hp(1)),
      padding: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
      decoration: BoxDecoration(
        color: AppColors.homeBackgorund, 
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), 
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search,
              color: Colors.black.withOpacity(0.5)), 
          hintText: 'search by name',
          hintStyle: AppTypography.montserratRegular.copyWith(
              color: Colors.black.withOpacity(0.5)), 
          border: InputBorder.none, 
          enabledBorder: InputBorder.none, 
          focusedBorder: InputBorder.none, 
          fillColor: Colors.transparent, 
          contentPadding: EdgeInsets.symmetric(
              horizontal: responsive.wp(2),
              vertical: responsive.hp(1.5)), 
        ),
      ),
    );
  }
}
