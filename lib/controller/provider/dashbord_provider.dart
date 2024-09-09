import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerNameProvider = Provider<String>((ref) => 'Lee Chong Wei');
final playerLevelProvider = Provider<String>((ref) => 'Advance');
final playerLocationProvider = Provider<String>((ref) => 'Kuala Lumpur');
// Add more providers as needed for other data
