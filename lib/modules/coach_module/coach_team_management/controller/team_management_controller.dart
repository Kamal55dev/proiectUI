import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createteamControllerProvider = ChangeNotifierProvider((ref) => CreateTeamController());

class CreateTeamController extends ChangeNotifier {
  final teamnameController = TextEditingController();
  final teamcolorController = TextEditingController();
  final teamsearchController = TextEditingController();
  final teamsearchCoachController = TextEditingController();
  final searchteamController = TextEditingController();

int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); 
  }

//   final AuthService _authService;
//   final DataStorage _dataStorage;
//   int? _responseStatusCode;
//   int? get responseStatusCode => _responseStatusCode;
//   List<TeamModel> teams = [];
//   List<CoachModel> coachList = [];
//   List<AssignCoachList> teamCoaches = [];
//   List<PlayerModel> playerList = [];
//   List<AssignPlayerList> teamplayers = [];
//   List<PlayerModel> filteredPlayerList = [];
//   List<CoachModel> filteredCoatchList = [];
//   List<TeamModel> filteredTeams = [];

//    int? totalTeams;
//   int? totalPlayers;
//   int? totalCoaches;
//   bool loading = false;
//   void setLoading(bool value) {
//     loading = value;
//     notifyListeners();
//   }

//   CreateTeamController(Ref ref)
//       : _authService = ref.read(authServiceProvider),
//         _dataStorage = ref.read(dataStorageProvider) {
//     getTeams();
//     getCoatchList();
//     filteredPlayerList = playerList;
//         filteredTeams = teams;

//   }
// //===============createTeam==================
//   Future<void> createTeam() async {
//     final model = TeamModel(
//       name: teamnameController.text,
//       color: teamcolorController.text,
//     );

//     try {
//       final loginResponse = await _dataStorage.getLoginResponse();
//       int userId;
//       if (loginResponse != null && loginResponse.user.id != null) {
//         userId = loginResponse.user.id!;

//         log('User ID: $userId');
//       } else {
//         log('User ID not found in storage');
//         throw Exception('User ID not found in storage');
//       }
//       final response = await _authService.createTeam(model, userId);

//       if (response.statusCode == 201 || response.statusCode == 202) {
//         log("Team created successfully");
//       } else {
//         log("Failed to create team: ${response.statusCode}");
//       }
//     } catch (e) {
//       log("Error creating team: $e");
//     }
//   }

// //===============getteams==========================
//   Future<void> getTeams() async {
//     try {
//       setLoading(true);

//       final loginResponse = await _dataStorage.getLoginResponse();
//       int academyId;
//       if (loginResponse != null && loginResponse.user.id != null) {
//         academyId = loginResponse.user.academyId!;
//         log('academyId ID: $academyId');
//       } else {
//         log('academyId ID not found in storage');
//         throw Exception('academyId ID not found in storage');
//       }

//       final response = await _authService.getTeams(academyId);
//       _responseStatusCode = response.statusCode;
//       notifyListeners();

//       if (response.statusCode == 201) {
//         log('Success: Teams fetched');
//         final List<dynamic> data = response.data;
//         teams = data.map((e) => TeamModel.fromJson(e)).toList();
//                 filteredTeams = teams;

//       } else {
//         log("Failed to get teams: ${response.statusCode}");
//       }
//     } catch (e) {
//       log("Error getting teams: $e");
//       _responseStatusCode = 404;
//     } finally {
//       setLoading(false);
//     }
//   }

// //===================getcoachlist===================
//   Future<void> getCoatchList() async {
//     try {
//       setLoading(true);

//       final response = await _authService.getCoatchList();

//       _responseStatusCode = response.statusCode;
//       notifyListeners();

//       if (response.statusCode == 200) {
//         final List<dynamic> data = response.data;
//         coachList = data.map((e) => CoachModel.fromJson(e)).toList();
//         filteredCoatchList = coachList;
//         notifyListeners();
//       } else {
//         log("Failed to get coach list: ${response.statusCode}");
//       }
//     } catch (e) {
//     } finally {
//       setLoading(false);
//     }
//   }

//   Future<void> assignCoach(int teamId, int coachId) async {
//     try {
//       final response = await _authService.assignCoach(teamId, coachId);

//       if (response.statusCode == 201 || response.statusCode == 202) {
//         debugPrint("Assign Coach successfully$response");
//         await getCoaches(teamId);
//       } else {
//         debugPrint("Failed to Assign Coach: ${response.statusCode}");
//       }
//     } catch (e) {
//       debugPrint("Error Assign Coach: $e");
//     }
//   }


//   Future<void> getCoaches(int teamId) async {
//     try {
//       setLoading(true);

//       final response = await _authService.getCoaches(teamId);

//       _responseStatusCode = response.statusCode;

//       if (response.statusCode == 200) {
//         final List<dynamic> data = response.data;
//         teamCoaches = data.map((e) => AssignCoachList.fromJson(e)).toList();
//         log('Success: $teamCoaches');
//         notifyListeners();
//       } else {
//         log("Failed to get coach list: ${response.statusCode}");
//       }
//     } catch (e) {
//       log("Error getting coach list: $e");
//     } finally {
//       setLoading(false);
//     }
//   }

//   Future<void> deleteCoach(int teamId, int index) async {
//     try {
//       final response = await _authService.deleteCoaches(teamId);

//       _responseStatusCode = response.statusCode;
//       notifyListeners();

//       if (response.statusCode == 204) {
//         log("Coach deleted successfully");
//         teamCoaches.removeAt(index);
//         notifyListeners();
//       } else {
//         log("Failed to delete coach: ${response.statusCode}");
//       }
//     } catch (e) {
//       log("Error deleting coach: $e");
//     }
//   }

//   Future<void> getPlayerList() async {
//     try {
//       setLoading(true);

//       final response = await _authService.getPlayerList();

//       _responseStatusCode = response.statusCode;
//       notifyListeners();

//       if (response.statusCode == 200) {
//         log('suceess getttplayer ');
//         final List<dynamic> data = response.data;
//         playerList = data.map((e) => PlayerModel.fromJson(e)).toList();
//         filteredPlayerList = playerList;

//         notifyListeners();
//       } else {
//         log("Failed to get coach list: ${response.statusCode}");
//       }
//     } catch (e) {
//       log("Error getting coach list: $e");
//     } finally {
//       setLoading(false);
//     }
//   }

//   //=============assignplayer=======================
// Future<void> assignPlayer(int teamId, int coachId) async {
//   try {
//     final response = await _authService.assignPlayer(teamId, coachId);

//     if (response.statusCode == 201 || response.statusCode == 202) {
//       log("Assign Player successfully: $response");
//       await getassignedPlayers(teamId);
//     } else {
//       log("Failed to Assign Player: ${response.statusCode}");
//     }
//   } catch (e) {
//     log("Error Assign Player: $e");
//     if (e is DioException && e.response?.statusCode == 500) {
//       // Handle server error specifically
//       log("Server error while assigning player. Please try again later.");
//     } else {
//       // Handle other errors
//       log("Unexpected error occurred.");
//     }
//   }
// }


//   Future<void> getassignedPlayers(int teamId) async {
//     try {
//       setLoading(true);

//       final response = await _authService.getPlayers(teamId);

//       _responseStatusCode = response.statusCode;

//       if (response.statusCode == 200) {
//         final List<dynamic> data = response.data;
//         teamplayers = data.map((e) => AssignPlayerList.fromJson(e)).toList();
//         log('Success players fetched: $teamCoaches');
//         notifyListeners();
//       } else {
//         log("Failed to get players list: ${response.statusCode}");
//       }
//     } catch (e) {
//       log("Error getting players list: $e");
//     } finally {
//       setLoading(false);
//     }
//   }

//   Future<void> deletePlayer(int teamId, int index) async {
//     try {
//       final response = await _authService.deletePlayer(teamId);

//       _responseStatusCode = response.statusCode;
//       notifyListeners();

//       if (response.statusCode == 204) {
//         log("Coach deleted successfully");
//         teamplayers.removeAt(index);
//         notifyListeners();
//       } else {
//         log("Failed to delete coach: ${response.statusCode}");
//       }
//     } catch (e) {
//       log("Error deleting coach: $e");
//     }
//   }


//  Future<void> getteamInfo() async {
//     try {
//       final loginResponse = await _dataStorage.getLoginResponse();
//       int academyId;
//       if (loginResponse != null && loginResponse.user.academyId != null) {
//         academyId = loginResponse.user.academyId!;
//         log('academyId ID: $academyId');
//       } else {
//         log('academyId ID not found in storage');
//         throw Exception('academyId ID not found in storage');
//       }

//       final response = await _authService.getTeambyInfo(academyId);
//       if (response.statusCode == 200) {
//         log('suuccceesss$response');
//         final data = response.data[0];
//         totalTeams = data['totalTeams'];
//         totalPlayers = data['totalPlayers'];
//         totalCoaches = data['totalCoaches'];
//         notifyListeners();
//       } else if (response.statusCode == 404) {
//         log("TeamInfo not found: ${response.statusCode}");
//       } else {
//         log("Failed to get TeamInfo: ${response.statusCode}");
//       }
//     } catch (e) {
//       log("Error getting TeamInfo: $e");
//     }
//   }

//   bool noResultFound = false;

//   void filterPlayers(String query) {
//     if (query.isEmpty) {
//       filteredPlayerList = playerList;
//       noResultFound = false;
//     } else {
//       filteredPlayerList =
//           playerList.where((player) => player.name.toLowerCase().contains(query.toLowerCase())).toList();

//       noResultFound = filteredPlayerList.isEmpty;

//       if (!noResultFound) {
//         filteredPlayerList.sort((a, b) {
//           if (a.name.toLowerCase() == query.toLowerCase()) {
//             return -1;
//           } else if (b.name.toLowerCase() == query.toLowerCase()) {
//             return 1;
//           } else {
//             return a.name.toLowerCase().compareTo(b.name.toLowerCase());
//           }
//         });
//       }
//     }
//     notifyListeners();
//   }

//   void filterCoach(String query) {
//     if (query.isEmpty) {
//       filteredCoatchList = coachList;
//       noResultFound = false;
//     } else {
//       filteredCoatchList = coachList.where((coach) => coach.name.toLowerCase().contains(query.toLowerCase())).toList();

//       noResultFound = filteredCoatchList.isEmpty;

//       if (!noResultFound) {
//         filteredCoatchList.sort((a, b) {
//           if (a.name.toLowerCase() == query.toLowerCase()) {
//             return -1;
//           } else if (b.name.toLowerCase() == query.toLowerCase()) {
//             return 1;
//           } else {
//             return a.name.toLowerCase().compareTo(b.name.toLowerCase());
//           }
//         });
//       }
//     }
//     notifyListeners();
//   }

//    void filterTeams(String query) {
//   if (query.isEmpty) {
//     filteredTeams = teams;
//     noResultFound = false;
//   } else {
//     filteredTeams = teams.where((team) => team.name?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
//     noResultFound = filteredTeams.isEmpty;

//     if (!noResultFound) {
//       filteredTeams.sort((a, b) {
//         if (a.name?.toLowerCase() == query.toLowerCase()) {
//           return -1;
//         } else if (b.name?.toLowerCase() == query.toLowerCase()) {
//           return 1;
//         } else {
//           return a.name?.toLowerCase().compareTo(b.name?.toLowerCase() ?? '') ?? 0;
//         }
//       });
//     }
//   }
//   notifyListeners();
// }

}

