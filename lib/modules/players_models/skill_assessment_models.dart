class Subjects {
  final String date;
  final String monthYear;
  final String title;
  final String name;
  final String status;
  final bool hasDot;
  final double? rating; // Add this field for the rating
  final bool isRated; // Add this field to check if the card has a rating

  Subjects({
    required this.date,
    required this.monthYear,
    required this.title,
    required this.name,
    required this.status,
    required this.hasDot,
    this.rating, // Optional rating
    this.isRated = false, // Default to false for cards without rating
  });
}
