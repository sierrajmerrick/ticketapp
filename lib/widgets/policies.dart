import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class Policies extends StatelessWidget {
  const Policies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Text(
            'POLICIES',
            style: GoogleFonts.ebGaramond(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Card(
            color: AppColors.card,
            child: Column(
              children: [
                ExpansionTile(
                  title: Text(
                    'Refund Policy',
                    style: GoogleFonts.ebGaramond(),
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Tickets are non-refundable unless the event is cancelled.',
                      ),
                    ),
                  ],
                ),

                ExpansionTile(
                  title: Text(
                    'Ticket Transfers',
                    style: GoogleFonts.ebGaramond(),
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Ticket transfers may be available depending on the event.',
                      ),
                    ),
                  ],
                ),

                ExpansionTile(
                  title: Text(
                    'Event Admission',
                    style: GoogleFonts.ebGaramond(),
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Please arrive at least 15 minutes before the event.',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}