import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Painter Example')),
        body: Center(
          child: CustomPaint(
            size: Size(200, -10), 
            painter: SemicirclePainter(),
          ),
        ),
      ),
    );
  }
}

class SemicirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height) // Start at bottom-left
      ..arcToPoint(
        Offset(size.width, size.height), // End at bottom-right
        radius: Radius.circular(size.width / 1.5),
        clockwise: false,
      )
      ..lineTo(size.width, 0) // Line to top-right corner
      ..lineTo(0, 0) // Line to top-left corner
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
