import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/shows_today.dart';
import '../widgets/showtimes.dart';
import '../widgets/upcoming_shows.dart';
import '../widgets/policies.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DaisyNavigationBar(),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ShowsToday(),
                  Showtimes(),
                  UpcomingShows(),
                  Policies(),
                  DaisyFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}