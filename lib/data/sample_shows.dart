import '../models/show.dart';

final List<Show> sampleShows = [
  Show(
    id: 1,
    title: 'Magic Night',
    description: 'Experience an unforgettable evening of magic.',
    date: DateTime(2026, 11, 20),
    time: '7:00 PM',
    price: 25.00,
    imagePath: 'assets/images/hampster-magic.webp',
    // Will specialize
    stripeLink: 'https://buy.stripe.com/test_fZu14n8f1bsgc0472x2wU05',
  ),
  Show(
    id: 2,
    title: 'Comedy Live',
    description: 'Enjoy a night full of laughter and entertainment.',
    date: DateTime(2026, 11, 22),
    time: '8:30 PM',
    price: 30.00,
    imagePath: 'assets/images/hampster-comedy.webp',
    stripeLink: 'https://buy.stripe.com/test_3cIbJ1eDpfIw0hmdqV2wU04',
  ),
  Show(
    id: 3,
    title: 'Rock Festival',
    description: 'An incredible night of live rock music.',
    date: DateTime(2026, 11, 25),
    time: '9:00 PM',
    price: 45.00,
    imagePath: 'assets/images/hampster-rock.webp',
    stripeLink: 'https://buy.stripe.com/test_14AaEX9j5aoc4xCbiN2wU03',
  ),
];
