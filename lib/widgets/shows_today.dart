import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ShowsToday extends StatelessWidget {
  const ShowsToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      color: AppColors.background,
      child: Column(
        children: [
          const Text(
            'SHOWS TODAY',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 30),

          Container(
            width: 800,
            height: 280,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                'Featured Show',
                style: TextStyle(fontSize: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}