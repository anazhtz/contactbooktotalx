import 'package:contactbooktotalx/utilis/responsive.dart';
import 'package:flutter/material.dart';

class IconFilterButton extends StatelessWidget {
  final Responsive responsive;
  final VoidCallback onPressed;

  const IconFilterButton({
    super.key,
    required this.responsive,
    required this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SizedBox(
        width: responsive.hp(3),
        height: responsive.hp(3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: responsive.hp(2.5),
              height: responsive.hp(0.3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: responsive.hp(0.3)),
            Container(
              width: responsive.hp(2),
              height: responsive.hp(0.3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: responsive.hp(0.3)),
            Container(
              width: responsive.hp(1.5),
              height: responsive.hp(0.3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
      onPressed: onPressed, 
    );
  }
}
