import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class Showtimes extends StatelessWidget {
  const Showtimes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Text(
            'SHOWTIMES',
            style: GoogleFonts.ebGaramond(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _showtimeCard('The Phantom Show', '7:00 PM'),
              _showtimeCard('Magic Nights', '8:30 PM'),
              _showtimeCard('Comedy Live', '9:00 PM'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _showtimeCard(String title, String time) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.ebGaramond(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            time,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}