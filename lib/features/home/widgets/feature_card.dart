import 'package:flutter/material.dart';

enum FeatureCardVariant {
  outlined,
  dashed,
  filled,
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final FeatureCardVariant variant;
  final Color? backgroundColor;

  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.variant = FeatureCardVariant.outlined,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: onTap,
        child: _buildCardContent(),
      ),
    );
  }

  Widget _buildCardContent() {
    final content = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    switch (variant) {
      case FeatureCardVariant.outlined:
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey[300]!),
          ),
          child: content,
        );
      case FeatureCardVariant.dashed:
        return CustomPaint(
          painter: DashedBorderPainter(),
          child: content,
        );
      case FeatureCardVariant.filled:
        return Card(
          elevation: 0,
          color: backgroundColor ?? Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: content,
        );
    }
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5;
    const dashSpace = 3;
    double startX = 0;
    final path = Path();

    // Draw top border
    while (startX < size.width) {
      path.moveTo(startX, 0);
      path.lineTo(startX + dashWidth, 0);
      startX += dashWidth + dashSpace;
    }

    // Draw right border
    double startY = 0;
    while (startY < size.height) {
      path.moveTo(size.width, startY);
      path.lineTo(size.width, startY + dashWidth);
      startY += dashWidth + dashSpace;
    }

    // Draw bottom border
    startX = size.width;
    while (startX > 0) {
      path.moveTo(startX, size.height);
      path.lineTo(startX - dashWidth, size.height);
      startX -= dashWidth + dashSpace;
    }

    // Draw left border
    startY = size.height;
    while (startY > 0) {
      path.moveTo(0, startY);
      path.lineTo(0, startY - dashWidth);
      startY -= dashWidth + dashSpace;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
} 