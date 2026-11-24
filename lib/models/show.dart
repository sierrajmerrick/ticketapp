class Show {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final String time;
  final double price;
  final String imagePath;
  final String stripeLink;
  final String city;
  final String venue;
  final String artist;

  const Show({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.price,
    required this.imagePath,
    required this.stripeLink,
    this.city = '',
    this.venue = '',
    this.artist = '',
  });
}
