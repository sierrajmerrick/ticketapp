import '../models/show.dart';

final List<Show> sampleShows = [
  Show(
    id: 1,
    title: 'Magic Night',
    description: 'Experience an unforgettable evening of magic.',
    date: DateTime(2026, 11, 20),
    time: '7:00 PM',
    price: 25.00,
    imagePath: 'assets/images/magic_night.jpg',
  ),
  Show(
    id: 2,
    title: 'Comedy Live',
    description: 'Enjoy a night full of laughter and entertainment.',
    date: DateTime(2026, 11, 22),
    time: '8:30 PM',
    price: 30.00,
    imagePath: 'assets/images/comedy_live.jpg',
  ),
  Show(
    id: 3,
    title: 'Rock Festival',
    description: 'An incredible night of live rock music.',
    date: DateTime(2026, 11, 25),
    time: '9:00 PM',
    price: 45.00,
    imagePath: 'assets/images/rock_festival.jpg',
  ),
];