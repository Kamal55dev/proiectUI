import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coachprofilecontrollerProvider =
    ChangeNotifierProvider((ref) => CoachProfileController());

class CoachProfileController extends ChangeNotifier {
  final licenseController = TextEditingController();
  final specializationController = TextEditingController();
    final rakController = TextEditingController();


  final certificatesController = TextEditingController();
  bool _isAddLaterSelected = false;
  bool _ispsecialization =false;
  bool get ispsecialization => _ispsecialization;
  bool _isfileupload=false;
  bool get isfileupload=>_isfileupload;

 void isfileuploadSelection() {
    _isfileupload = !_isfileupload;
    notifyListeners();
  }
  bool get isAddLaterSelected => _isAddLaterSelected;
  bool isFormValid = false;
  bool _isSpecializationFormValid = false; 
  bool get isSpecializationFormValid => _isSpecializationFormValid;

  void updateSpecializationFormState(bool isValid) {
    _isSpecializationFormValid = isValid;
    notifyListeners();
  }

  void updateFormState(bool isValid) {
    isFormValid = isValid;
    notifyListeners();
  }

  void specializationSelection() {
    _ispsecialization = !_ispsecialization;
    notifyListeners();
  }
  void toggleAddLaterSelection() {
    _isAddLaterSelected = !_isAddLaterSelected;
    notifyListeners();
  }

  int _selectedIndex = -1;
  int _coachopening = -1;
  int get coachopening => _coachopening;

  int get selectedIndex => _selectedIndex;
  void selectcoachopening(int index) {
    _coachopening = index;
    notifyListeners();
  }

  void selectItem(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    licenseController.dispose();
    specializationController.dispose();
    certificatesController.dispose();
    super.dispose();
  }
}
