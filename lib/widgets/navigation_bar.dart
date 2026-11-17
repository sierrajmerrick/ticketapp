import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DaisyNavigationBar extends StatelessWidget {
  const DaisyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      color: AppColors.navbar,
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo_main.png',
            height: 65,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),
          const Text(
            'Daisy Chain Tickets',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 212, 82, 6),
            ),
          ),
          const Spacer(),

          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: AppColors.textPrimary,
            ),
            child: const Text('Policies'),
          ),
          
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: AppColors.textPrimary,
            ),
            child: const Text('Deals'),
          ),

          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: AppColors.textPrimary,
            ),
            child: const Text('Upcoming Shows'),
          ),

          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: AppColors.textPrimary,
            ),
            child: const Text('Showtimes'),
          ),
        ],
      ),
    );
  }
}