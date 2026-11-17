import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DaisyFooter extends StatelessWidget {
  const DaisyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      color: AppColors.navbar,
      child: const Center(
        child: Text(
          '© 2026 Daisy Chain Tickets. All rights reserved.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}