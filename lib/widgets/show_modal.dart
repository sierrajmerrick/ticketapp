import 'package:flutter/material.dart';
import '../models/show.dart';
import '../theme/app_colors.dart';
import 'payment_popup.dart';

class ShowModal extends StatelessWidget {
  final Show show;

  const ShowModal({
    super.key,
    required this.show,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.card,
      title: Text(
        show.title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  show.imagePath,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 220,
                      child: Center(
                        child: Icon(
                          Icons.theater_comedy,
                          size: 80,
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  },
                ), 
              ),
              const SizedBox(height: 20),

              Text(
                show.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),


              const SizedBox(height: 20),

              Text(
                'Date: ${show.date.month}/${show.date.day}/${show.date.year}',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 8),

              Text(
                'Time: ${show.time}',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 8),

              Text(
                'Price: \$${show.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
        ),

        ElevatedButton(
          onPressed: () {
            final navigator = Navigator.of(context);
            final navigatorContext = navigator.context;

            navigator.pop();

            showDialog(
              context: navigatorContext,
              builder: (dialogContext) => PaymentPopup(show: show),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
          child: const Text('Buy Ticket'),
        ),
      ],
    );
  }
}