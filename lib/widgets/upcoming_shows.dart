import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/sample_shows.dart';
import 'show_card.dart';

class UpcomingShows extends StatelessWidget {
  const UpcomingShows({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Text(
            'UPCOMING SHOWS',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),
          SizedBox(
            height: 260,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: sampleShows.map((show) {
                        return ShowCard(show: show);
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _showCard(String title) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.primary),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}