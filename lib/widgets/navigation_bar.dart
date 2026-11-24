import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class DaisyNavigationBar extends StatelessWidget {
  const DaisyNavigationBar({super.key});

  Widget _navButton(String label) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
      ),
      child: Text(
        label,
        style: GoogleFonts.tinos(
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

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
          Text(
            'Daisy Chain Tickets',
            style: GoogleFonts.ebGaramond(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 212, 82, 6),
            ),
          ),
          const Spacer(),

          _navButton('Policies'),
          
          _navButton('Deals'),

          _navButton('Upcoming Shows'),

          _navButton('Showtimes'),
        ],
      ),
    );
  }
}