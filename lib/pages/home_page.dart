import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/shows_today.dart';
import '../widgets/showtimes.dart';
import '../widgets/upcoming_shows.dart';
import '../widgets/policies.dart';
import '../widgets/footer.dart';
import '../widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _handleSearch(
    String location,
    DateTime? date,
    String query,
  ) {
    debugPrint('Search received by HomePage:');
    debugPrint('Location: $location');
    debugPrint('Date: $date');
    debugPrint('Query: $query');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DaisyNavigationBar(),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DaisySearchBar(
                    onSearch: _handleSearch,
                  ),
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