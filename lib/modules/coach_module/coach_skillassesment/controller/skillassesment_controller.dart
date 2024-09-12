import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final skillControllerProvider =
    ChangeNotifierProvider((ref) => SkillAssementController());

class SkillAssementController extends ChangeNotifier {
  final Map<int, double> _ratings = {};
  final Map<int, String> _comments = {}; // Track comments for each item

  // Method to get the rating for a specific item
  double getRating(int index) {
    return _ratings[index] ?? 0; // Return 0 if no rating is set yet
  }

  // Method to update the rating for a specific item
  void updateRating(int index, double newRating) {
    _ratings[index] = newRating;
    notifyListeners(); // Notify listeners to rebuild the UI
  }

  // Method to get the comment for a specific item
  String getComment(int index) {
    return _comments[index] ?? ''; // Return empty string if no comment
  }

  // Method to update the comment for a specific item
  void updateComment(int index, String comment) {
    _comments[index] = comment;
    notifyListeners(); // Notify listeners to rebuild the UI
  }
}
