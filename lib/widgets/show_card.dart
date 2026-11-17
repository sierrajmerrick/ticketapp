import 'package:flutter/material.dart';
import '../models/show.dart';
import '../theme/app_colors.dart';
import 'show_modal.dart';

class ShowCard extends StatelessWidget {
  final Show show;

  const ShowCard({
    super.key,
    required this.show,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ShowModal(show: show),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 250,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primary,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                show.imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.theater_comedy,
                      size: 70,
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    show.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '\$${show.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}