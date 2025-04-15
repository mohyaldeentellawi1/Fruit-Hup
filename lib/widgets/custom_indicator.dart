import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color:
            isActive
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: 0.5),
        shape: BoxShape.circle,
      ),
    );
  }
}
