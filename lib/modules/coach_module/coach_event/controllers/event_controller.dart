import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final eventControllerProvider =
    ChangeNotifierProvider((ref) => EventController());
final dropdownValueProvider = StateProvider<String?>((ref) => null);
final dropdownValueProvider1 = StateProvider<String?>((ref) => null);
final radioSelectedValueProvider = StateProvider<int>((ref) => 0);
final searchTextProvider = StateProvider<String>((ref) => '');

class EventController extends ChangeNotifier {
  final TextEditingController eventController = TextEditingController();
  final TextEditingController searchTextController = TextEditingController();
  final addressController = TextEditingController();
     bool _isSwitchOn = false;

  bool get isSwitchOn => _isSwitchOn;

  void toggleSwitch(bool value) {
    _isSwitchOn = value;
    notifyListeners(); 
  }


  // final EventServices _eventServices;
  // final DataStorage _dataStorage;

  // EventController(Ref ref)
  //     : _eventServices = ref.read(eventServiceProvider),
  //       _dataStorage = ref.read(dataStorageProvider);

  DateTime? _startDateTime;
  DateTime? _endDateTime;
  String? _validationMessage;

  DateTime? get startDateTime => _startDateTime;
  DateTime? get endDateTime => _endDateTime;

  Future<void> pickStartDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _startDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _startDateTime) {
      _startDateTime = pickedDate;
      notifyListeners();
      pickStartTime(
          context); // Optionally, open time picker right after date is picked
    }
  }

  // Method to show time picker for start time
  Future<void> pickStartTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_startDateTime ?? DateTime.now()),
    );
    if (pickedTime != null) {
      _startDateTime = DateTime(
        _startDateTime?.year ?? DateTime.now().year,
        _startDateTime?.month ?? DateTime.now().month,
        _startDateTime?.day ?? DateTime.now().day,
        pickedTime.hour,
        pickedTime.minute,
      );
      notifyListeners();
    }
  }

  // Method to show date picker for end date
  Future<void> pickEndDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _endDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _endDateTime) {
      _endDateTime = pickedDate;
      notifyListeners();
      pickEndTime(
          context); // Optionally, open time picker right after date is picked
    }
  }

  // Method to show time picker for end time
  Future<void> pickEndTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_endDateTime ?? DateTime.now()),
    );
    if (pickedTime != null) {
      final newEndDateTime = DateTime(
        _endDateTime?.year ?? DateTime.now().year,
        _endDateTime?.month ?? DateTime.now().month,
        _endDateTime?.day ?? DateTime.now().day,
        pickedTime.hour,
        pickedTime.minute,
      );

      if (_startDateTime != null && newEndDateTime.isAfter(_startDateTime!)) {
        _endDateTime = newEndDateTime;
        validateEventDuration(); // Validate duration after setting end time
      } else {
        // Show error if the end time is before the start time
        _validationMessage = 'End time must be after the start time.';
      }
      notifyListeners();
    }
  }

  String getFormattedStartDate() {
    if (_startDateTime == null) return 'Select Date';
    return '${_startDateTime!.day}/${_startDateTime!.month}/${_startDateTime!.year}';
  }

  String getFormattedStartTime(BuildContext context) {
    if (_startDateTime == null) return 'Select Time';
    final time = TimeOfDay.fromDateTime(_startDateTime!);
    return time.format(context);
  }

  String getFormattedEndDate() {
    if (_endDateTime == null) return 'Select Date';
    return '${_endDateTime!.day}/${_endDateTime!.month}/${_endDateTime!.year}';
  }

  String getFormattedEndTime(BuildContext context) {
    if (_endDateTime == null) return 'Select Time';
    final time = TimeOfDay.fromDateTime(_endDateTime!);
    return time.format(context);
  }

  void setStartDateTime(DateTime dateTime) {
    _startDateTime = dateTime;
    validateEventDuration();
    notifyListeners();
  }

  void setEndDateTime(DateTime dateTime) {
    _endDateTime = dateTime;
    validateEventDuration();
    notifyListeners();
  }

  void validateEventDuration() {
    if (_startDateTime != null && _endDateTime != null) {
      final duration = _endDateTime!.difference(_startDateTime!);
      if (duration.inHours != 1) {
        _validationMessage =
            'You can only select a duration of 1 hour for your event.';
      } else {
        _validationMessage = null;
      }
    }
  }

  String get validationMessage => _validationMessage ?? '';
  //===============================Api functions====================

  // List<EventType> _eventTypes = [];
  // List<EventType> get eventTypes => _eventTypes;

  // int? _selectedEventTypeId;
  // int? get selectedEventTypeId => _selectedEventTypeId;

  // Future<void> getEventType() async {
  //   try {
  //     final loginResponse = await _dataStorage.getLoginResponse();
  //     int academyId;
  //     if (loginResponse != null && loginResponse.user.id != null) {
  //       academyId = loginResponse.user.academyId!;
  //       log('userId ID: $academyId');
  //     } else {
  //       log('userId ID not found in storage');
  //       throw Exception('userId ID not found in storage');
  //     }

  //     final response = await _eventServices.getEventType();
  //     if (response.statusCode == 200) {
  //       log('Success EventType: ${response.data}');
  //       _eventTypes = List<EventType>.from(
  //           response.data.map((e) => EventType.fromJson(e)));
  //       notifyListeners();
  //     } else if (response.statusCode == 404) {
  //       log("curriculum EventType: ${response.statusCode}");
  //     } else {
  //       log("Failed to get EventType: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     log("Error getting EventType: $e");
  //   }
  // }

  // void setSelectedEventType(int id) {
  //   _selectedEventTypeId = id;
  //   notifyListeners();
  // }

  List<String> _teamName = [];
  List<String> get teamName => _teamName;
  List<int> _teamId = [];
  List<int> get teamId => _teamId;

  // Future<void> getTeams() async {
  //   try {
  //     final loginResponse = await _dataStorage.getLoginResponse();
  //     int academyId;
  //     if (loginResponse != null && loginResponse.user.id != null) {
  //       academyId = loginResponse.user.academyId!;
  //       log('userId ID: $academyId');
  //     } else {
  //       log('userId ID not found in storage');
  //       throw Exception('userId ID not found in storage');
  //     }

  //     final response = await _eventServices.getTeams(academyId);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       log('Success getTeams: ${response.data}');
  //       // Extract event names from the response data
  //       _teamName = List<String>.from(response.data.map((e) => e['name']));
  //       _teamId = List<int>.from(
  //           response.data.map((e) => e['id'])); // Ensure the ID is int

  //       notifyListeners();
  //     } else if (response.statusCode == 404) {
  //       log("curriculum getTeams: ${response.statusCode}");
  //     } else {
  //       log("Failed to get getTeams: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     log("Error getting getTeams: $e");
  //   }
  // }

  // Future<void> getListofTeamMember(int teamId) async {
  //   log('Participants loaded: $_participants');
  //   try {
  //     final loginResponse = await _dataStorage.getLoginResponse();
  //     int academyId;
  //     if (loginResponse != null && loginResponse.user.id != null) {
  //       academyId = loginResponse.user.academyId!;
  //       log('userId ID: $academyId');
  //     } else {
  //       log('userId ID not found in storage');
  //       throw Exception('userId ID not found in storage');
  //     }

  //     final response =
  //         await _eventServices.getListofTeamMembers(academyId, teamId);
  //     if (response.statusCode == 202 || response.statusCode == 201) {
  //       log('Success getTeamsMember******: ${response.data}');

  //       // Check if responsedata is a List of Map
  //       if (response.data is List) {
  //         _participants = (response.data as List)
  //             .map((participant) => ParticipantModel.fromJson(
  //                 participant as Map<String, dynamic>))
  //             .toList();
  //         log('suuuuucessss$_participants');
  //         log('Participants: $_participants');
  //         updateFilteredParticipants('');
  //       } else {
  //         log('Unexpected response format: ${response.data}');
  //       }
  //     } else if (response.statusCode == 404) {
  //       log("curriculum getTeamsMember******: ${response.statusCode}");
  //     } else {
  //       log("Failed to get getTeamsMember******: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     log("Error getting getTeamsMember******: $e");
  //   }
  // }

  List<String> participantNames = [];

  // List of participant IDs
  // List<String> participantIds = [];
  // List<ParticipantModel> _participants = [];
  // List<ParticipantModel> _filteredParticipants = [];
  // List<ParticipantModel> _selectedParticipants = [];
  // List<int> _selectedParticipantIds = [];

  // List<ParticipantModel> get filteredParticipants => _filteredParticipants;
  // List<ParticipantModel> get selectedParticipants => _selectedParticipants;
  // List<int> get selectedParticipantIds => _selectedParticipantIds;

  // void addSelectedParticipant(ParticipantModel model) {
  //   if (!_selectedParticipants.contains(model)) {
  //     _selectedParticipants.add(model);
  //     // participantNames.add(model);
  //     // _selectedParticipantIds.add(int.parse(participantId));

  //     searchTextController.clear();
  //     notifyListeners();
  //   }
  // }

  // void removeSelectedParticipant(ParticipantModel participant) {
  //   int index = _selectedParticipants.indexOf(participant);
  //   if (index != -1) {
  //     _selectedParticipants.removeAt(index);
  //     participantNames.removeAt(index);
  //     participantIds.removeAt(index);
  //     notifyListeners();
  //   }
  // }

  // void updateFilteredParticipants(String query) {
  //   log('Updating filtered participants with query: $query');
  //   if (query.isEmpty) {
  //     _filteredParticipants = _participants;
  //   } else {
  //     _filteredParticipants = _participants
  //         .where((participant) =>
  //             participant.name.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   }
  //   log('Filtered Participants: $_filteredParticipants');
  //   notifyListeners();
  // }

  // void selectAllParticipants() {
  //   if (_participants.isEmpty) {
  //     log('No participants to select');
  //     return;
  //   }
  //   _selectedParticipants = List.from(_participants);
  //   log('All participants selected: $_selectedParticipants');
  //   log('Selected participant IDs: $_selectedParticipantIds');

  //   notifyListeners();
  // }

  // void clearAllParticipantsSelection() {
  //   _selectedParticipants.clear();
  //   log('All participants selection cleared');
  //   notifyListeners();
  // }

  // Future<void> submitEvent(BuildContext context) async {
  //   try {
  //     final loginResponse = await _dataStorage.getLoginResponse();
  //     final userId = loginResponse?.user.id;

  //     if (userId != null) {
  //       final DateFormat formatter = DateFormat('MM-dd-yyyy HH:mm');

  //       // Format the startDate and endDate
  //       final String formattedStartDate = formatter.format(_startDateTime!);
  //       final String formattedEndDate = formatter.format(_endDateTime!);
       
  //       List<int> participantIds = _selectedParticipants.map((participant) => participant.id).toList();

  //       final eventData = Event(
  //         eventType: _selectedEventTypeId!,
  //         eventName: eventController.text,
  //         startDate: formattedStartDate,
  //         endDate: formattedEndDate,
  //         venue: addressController.text,
  //         participants: participantIds,
  //       );

  //       log('Event Data: ${eventData.toJson()}');
  //       final response = await _eventServices.createEvent();

  //       if (response.statusCode == 200 || response.statusCode == 202) {
  //         log('Event Submitted Successfully');
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text('Event Submitted Successfully')),
  //         );
  //         clearAllParticipantsSelection();
  //         eventController.clear();
  //         addressController.clear();
  //         _startDateTime = null;
  //         _endDateTime = null;
  //         notifyListeners();
  //         Navigator.pop(context);
  //       } else {
  //         log('Failed to submit event: ${response.statusCode}');
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //               content:
  //                   Text('Failed to submit event: ${response.statusCode}')),
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     log('Error submitting event: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error submitting event: $e')),
  //     );
  //   }
  // }

  // var lat;
  // var long;

  // String? subLocality;
  // String? locality;
  // String? address = "";

  // Future<void> determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //   var location = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.best);
  //   lat = location.latitude.toString();
  //   long = location.longitude.toString();
  //   notifyListeners();
  //   List<Placemark> placeMark =
  //       await placemarkFromCoordinates(location.latitude, location.longitude);
  //   Placemark place = placeMark[0];
  //   subLocality = place.subLocality;
  //   locality = place.locality;
  //   String completeAddress = '${place.name}';

  //   addressController.text = completeAddress;

  //   notifyListeners();
  // }
}
