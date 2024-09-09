import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loaderProvider = ChangeNotifierProvider((ref) => LoaderScreenController());

class LoaderScreenController extends ChangeNotifier {
  bool _isLoader = false;
  bool get isLoader => _isLoader;

  bool _isVerificationLink = false;
  bool get isVerificationLink => _isVerificationLink;

  bool _isCoachSearchLoader = false;
  bool get isCoachSearchLoader => _isCoachSearchLoader;

  void setLoader(bool value) {
    _isLoader = value;

    notifyListeners();
  }

  void _setCoachSearchLoader(bool value) {
    _isCoachSearchLoader = value;
    notifyListeners();
  }

  void _setIsVerificationLink(bool value) {
    _isVerificationLink = value;
    notifyListeners();
  }

  void simulateDemoIsLoaderDelay() {
    _setIsVerificationLink(false);
    setLoader(true); // Start verification process
    Future.delayed(const Duration(seconds: 3), () {
      setLoader(false); // End verification process
    });
  }

  void simulateDemoIsCoachLoaderDelay() {
    _setIsVerificationLink(false);
    setLoader(false);
    _setCoachSearchLoader(true); // Start verification process
    Future.delayed(const Duration(seconds: 3), () {
      _setCoachSearchLoader(false); // End verification process
    });
  }
}
