import 'package:badminton/common/common_button.dart';
import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/common/common_text_form_field.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/core/utils/validations.dart';
import 'package:badminton/modules/coach_module/coach_profile/controllers/coach_profile_controller.dart';
import 'package:badminton/modules/coach_module/coach_profile/views/coach_uploadfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachProfileLicense extends ConsumerStatefulWidget {
  const CoachProfileLicense({super.key});

  @override
  ConsumerState<CoachProfileLicense> createState() =>
      _CoachProfileLicenseState();
}

class _CoachProfileLicenseState extends ConsumerState<CoachProfileLicense> {
  final _formKey = GlobalKey<FormState>(); // Form key

  @override
  void initState() {
    super.initState();
    final profileController = ref.read(coachprofilecontrollerProvider);

    // Add listener to validate the form and update the button state
    profileController.licenseController.addListener(() {
      bool isValid = _formKey.currentState?.validate() ?? false;
      profileController.updateFormState(isValid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final kheight = MediaQuery.of(context).size.height;
    final kwidth = MediaQuery.of(context).size.width;
    final profileController = ref.watch(coachprofilecontrollerProvider);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: CustomText(
          text: 'Coaching Profile',
          color: white,
          fontSize: getResponsiveFontSize(context, 18),
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            icon: Icon(
              Icons.clear_rounded,
              color: white,
              size: kwidth * 0.07,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kheight * 0.02),
            Stack(
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    heightFactor: 0.6,
                    widthFactor: 0.9,
                    child: SizedBox(
                      height: kheight * 0.2,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/bg_images/Looper BG.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kwidth * 0.02, vertical: kheight * 0.045),
                  child: Form(
                    key: _formKey, // Assign the GlobalKey to the Form
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Do you have a BAM License Number?',
                          color: white,
                          fontSize: getResponsiveFontSize(context, 16),
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: kheight * 0.02),
                        CustomFormField(
                          fillColor: boxColor,
                          controller: profileController.licenseController,
                          hintText: 'License Number',
                          borderRadius: BorderRadius.circular(10),
                          obscureText: false,
                          cursorColor: white,
                          textcolor: white,
                          inputType: TextInputType.number,
                          textCapitalizationEnabled: false,
                          readOnly: false,
                          length: 50,
                          validator: validatelicenseNum,
                        ),
                        SizedBox(height: kheight * 0.005),
                        CustomText(
                          text: 'Format: 23245686',
                          color: grey,
                          fontSize: getResponsiveFontSize(context, 14),
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: kheight * 0.05),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CustomButton(
                            text: "No I don't",
                            textSize: getResponsiveFontSize(context, 14),
                            textColor: profileController.ispsecialization
                                ? black
                                : white,
                            backgroundColor:
                                profileController.ispsecialization
                                    ? secondaryColor
                                    : Colors.transparent,
                            borderRadius: 30.0,
                            borderColor: profileController.ispsecialization
                                ? secondaryColor
                                : secondaryColor,
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: kwidth * 0.25,
                            onPress: () {
                               profileController.specializationSelection();
                            },
                          ),
                        ),
                        SizedBox(height: kheight * 0.15),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, false);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: secondaryColor,
                                size: kwidth * 0.06,
                              ),
                            ),
                            SizedBox(width: kwidth * 0.02),
                            CustomText(
                              text: 'Previous',
                              color: secondaryColor,
                              fontSize: getResponsiveFontSize(context, 14),
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(width: kwidth * 0.48),
                            GestureDetector(
                              onTap: () {
                                // Trigger form validation
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  // Update the form state to valid
                                  profileController.updateFormState(true);
                                  // Navigate to the next screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CoachProfileUploadFile(),
                                    ),
                                  );
                                } else {
                                  // Update the form state to invalid if validation fails
                                  profileController.updateFormState(false);
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kwidth * 0.035),
                                margin: EdgeInsets.only(left: kwidth * 0.02),
                                height: kheight * 0.05,
                                width: kwidth * 0.23,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: profileController.isFormValid
                                        ? primaryColor
                                        : grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: profileController.isFormValid
                                      ? primaryColor
                                      : Colors.transparent,
                                ),
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: 'Next',
                                      color: white,
                                      fontSize:
                                          getResponsiveFontSize(context, 14),
                                      fontWeight: FontWeight.w400,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(width: kwidth * 0.02),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: white,
                                      size: kwidth * 0.05,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
