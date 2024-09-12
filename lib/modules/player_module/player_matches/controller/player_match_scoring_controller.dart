import 'package:flutter_riverpod/flutter_riverpod.dart';

// MatchController handles the match state, including `comment` and `matchType`
class MatchController extends StateNotifier<Map<String, String>> {
  MatchController() : super({
    'comment': '',    // Initial value for comment
    'matchType': '',  // Initial value for matchType
  });

  // Update comment
  void updateComment(String newComment) {
    state = {
      ...state,
      'comment': newComment,
    };
  }

  // Update match type
  void updateMatchType(String newMatchType) {
    state = {
      ...state,
      'matchType': newMatchType,
    };
  }
}

// Provider for MatchController
final matchProvider = StateNotifierProvider<MatchController, Map<String, String>>((ref) {
  return MatchController();
});
