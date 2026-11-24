import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/sample_shows.dart';
import 'show_card.dart';

class UpcomingShows extends StatefulWidget {
  const UpcomingShows({super.key});

  @override
  State<UpcomingShows> createState() => _UpcomingShowsState();
}

class _UpcomingShowsState extends State<UpcomingShows> {
  int _currentPage = 0;

  void _goToPage(int page) {
    if (page < 0 || page >= sampleShows.length) return;
    setState(() => _currentPage = page);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Text(
            'UPCOMING SHOWS',
            style: GoogleFonts.ebGaramond(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),
          SizedBox(
            height: 330,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final spacing = (constraints.maxWidth * 0.24)
                    .clamp(120.0, 230.0)
                    .toDouble();
                final orderedIndexes = List.generate(
                  sampleShows.length,
                  (index) => index,
                )
                  ..sort(
                    (a, b) =>
                        (a - _currentPage).abs().compareTo(
                              (b - _currentPage).abs(),
                            ),
                  );

                return GestureDetector(
                  onPanEnd: (details) {
                    final velocity = details.velocity.pixelsPerSecond.dx;
                    if (velocity < -250 && _currentPage < sampleShows.length - 1) {
                      _goToPage(_currentPage + 1);
                    } else if (velocity > 250 && _currentPage > 0) {
                      _goToPage(_currentPage - 1);
                    }
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: orderedIndexes.reversed.map((index) {
                      final distance = index - _currentPage;
                      final isFocused = distance == 0;
                      final scale = isFocused ? 1.08 : 0.78;
                      final dx = isFocused ? 0.0 : distance * spacing;

                      return AnimatedAlign(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeOutCubic,
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeOutCubic,
                          transform: Matrix4.translationValues(dx, 0, 0)
                            ..scaleByDouble(scale, scale, 1, 1),
                          transformAlignment: Alignment.center,
                          width: 280,
                          height: 300,
                          child: Opacity(
                            opacity: isFocused ? 1 : 0.75,
                            child: ShowCard(show: sampleShows[index]),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _currentPage > 0
                    ? () => _goToPage(_currentPage - 1)
                    : null,
                icon: const Icon(Icons.chevron_left),
                tooltip: 'Previous show',
              ),
              for (var index = 0; index < sampleShows.length; index++)
                GestureDetector(
                  onTap: () => _goToPage(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: _currentPage == index ? 22 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: 0.35),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              IconButton(
                onPressed: _currentPage < sampleShows.length - 1
                    ? () => _goToPage(_currentPage + 1)
                    : null,
                icon: const Icon(Icons.chevron_right),
                tooltip: 'Next show',
              ),
            ],
          ),
        ],
      ),
    );
  }
}