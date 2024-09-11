import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providers for controllers and state
final fullNameControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final mobileNumberControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final emailControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final locationControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());

// State providers for additional fields
final genderProvider = StateProvider<String>((ref) => '');
final selectedDateProvider = StateProvider<DateTime?>((ref) => null);
