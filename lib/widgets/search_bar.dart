import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DaisySearchBar extends StatefulWidget {
  const DaisySearchBar({
    super.key,
    required this.onSearch,
  });

  final void Function(
    String location,
    DateTime? date,
    String query,
  ) onSearch;

  @override
  State<DaisySearchBar> createState() => _DaisySearchBarState();
}

class _DaisySearchBarState extends State<DaisySearchBar> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  DateTime? selectedDate;

  @override
  void dispose() {
    locationController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 30,
      ),
      color: AppColors.background,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primary,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Location
            Expanded(
              flex: 2,
              child: TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    color: AppColors.primary,
                  ),
                  labelText: 'LOCATION',
                  hintText: 'City or Zip Code',
                  border: InputBorder.none,
                ),
              ),
            ),
            // Date
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2026),
                    lastDate: DateTime(2030),
                  );

                  if (pickedDate != null && mounted) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                
                child: InputDecorator(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.primary,
                    ),
                    labelText: 'DATES',
                    border: InputBorder.none,
                  ),
                  child: Text(
                    selectedDate == null
                        ? 'All Dates'
                        : '${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}',
                  ),
                ),
              ),
            ),
            // Search
            Expanded(
              flex: 3,
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.primary,
                  ),
                  labelText: 'SEARCH',
                  hintText: 'Artist, Event or Venue',
                  border: InputBorder.none,
                ),
              ),
            ),
            // Button
            ElevatedButton(
              onPressed: () {
                widget.onSearch(
                  locationController.text.trim(),
                  selectedDate,
                  searchController.text.trim(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 22,
                ),
              ),
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}