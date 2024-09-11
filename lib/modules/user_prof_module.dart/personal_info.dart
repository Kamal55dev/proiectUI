import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../controllers/user_prof_provider/personal_info_provider.dart';

class PersonalInfo extends ConsumerWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Accessing controllers from providers
    final fullNameController = ref.watch(fullNameControllerProvider);
    final emailController = ref.watch(emailControllerProvider);
    final locationController = ref.watch(locationControllerProvider);
    final mobileNumberController = ref.watch(mobileNumberControllerProvider);

    // Accessing state providers
    final selectedGender = ref.watch(genderProvider);
    final selectedDate = ref.watch(selectedDateProvider);

    // Default PhoneNumber configuration
    PhoneNumber number = PhoneNumber(isoCode: 'US');

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: MediaQuery.of(context).size.width > 600
              ? const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)
              : const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Personal Info',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextField(
                controller: fullNameController,
                decoration: _inputDecoration('Full Name'),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2C),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    mobileNumberController.text = number.phoneNumber ?? '';
                  },
                  initialValue: number,
                  formatInput: false,
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    showFlags: true,
                    useEmoji: true,
                  ),
                  textFieldController: mobileNumberController,
                  inputDecoration: _phoneInputDecoration(),
                  textStyle: const TextStyle(color: Colors.white),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  onSaved: (PhoneNumber number) {
                    // Handle save actions if required
                  },
                  countrySelectorScrollControlled: false,
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration('Email ID'),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 25),
              _buildGenderSelector(ref, selectedGender),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () => _showDatePicker(context, ref),
                child: AbsorbPointer(
                  child: TextField(
                    decoration: _inputDecoration(
                      selectedDate != null
                          ? DateFormat('dd-MMM-yyyy').format(selectedDate!)
                          : 'Date of Birth',
                      prefixIcon: Icons.calendar_today,
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: locationController,
                decoration: _inputDecoration('Your Location',
                    prefixIcon: Icons.location_on),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDDAC00),
                  minimumSize: Size(double.infinity,
                      MediaQuery.of(context).size.width > 600 ? 60 : 50),
                ),
                onPressed: () {
                  // Trigger update logic here
                },
                child:
                    const Text('Update', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, {IconData? prefixIcon}) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFF2C2C2C),
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white54),
      prefixIcon:
          prefixIcon != null ? Icon(prefixIcon, color: Colors.white54) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }

  InputDecoration _phoneInputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFF2C2C2C),
      labelText: 'Mobile Number',
      labelStyle: const TextStyle(color: Colors.white54),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 15),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    );
  }

  Widget _buildGenderSelector(WidgetRef ref, String selectedGender) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _genderOption(ref, 'Male', '♂️', selectedGender),
        _genderOption(ref, 'Female', '♀️', selectedGender),
        _genderOption(ref, 'Others', '⚧️', selectedGender),
      ],
    );
  }

  Widget _genderOption(
      WidgetRef ref, String gender, String emoji, String selectedGender) {
    return GestureDetector(
      onTap: () {
        ref.read(genderProvider.notifier).state = gender;
      },
      child: Chip(
        backgroundColor:
            selectedGender == gender ? Colors.white : const Color(0xFF2C2C2C),
        label: Row(
          children: [
            Text(gender,
                style: TextStyle(
                    color: selectedGender == gender
                        ? Colors.black
                        : Colors.white54)),
            const SizedBox(width: 5),
            Text(emoji),
          ],
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context, WidgetRef ref) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      ref.read(selectedDateProvider.notifier).state = picked;
    }
  }
}
