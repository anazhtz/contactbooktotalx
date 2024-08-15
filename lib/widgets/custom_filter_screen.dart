import 'package:contactbooktotalx/constand/app_color.dart';
import 'package:contactbooktotalx/constand/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomFilterScreen extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;
  final Color selectedColor;
  final Color borderColor;
  final String label;

  const CustomFilterScreen({
    super.key,
    required this.isSelected,
    required this.onPressed,
    required this.selectedColor,
    required this.borderColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? selectedColor : borderColor,
                width: isSelected ? 6.5 : 2,
              ),
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            label,
            style: AppTypography.montserratMedium.copyWith(
              fontSize: 20,
              color: AppColors.hintColor2,
            ),
          ),
        ],
      ),
    );
  }
}