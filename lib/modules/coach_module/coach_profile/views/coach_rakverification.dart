import 'package:badminton/common/common_button.dart';
import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/common/common_text_form_field.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/core/utils/validations.dart';
import 'package:badminton/modules/coach_module/coach_profile/controllers/coach_profile_controller.dart';
import 'package:badminton/modules/coach_module/coach_profile/views/coach_openforcoaching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachProfileRakVerification extends ConsumerStatefulWidget {
  const CoachProfileRakVerification({super.key});

  @override
  ConsumerState<CoachProfileRakVerification> createState() =>
      _CoachProfileRakVerificationState();
}

class _CoachProfileRakVerificationState
    extends ConsumerState<CoachProfileRakVerification> {
  final _formKey = GlobalKey<FormState>(); // Form key

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
          text: 'RAK Verification',
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
                    key: _formKey,
                    onChanged: () {
                      final isValid =
                          _formKey.currentState?.validate() ?? false;
                      profileController.updateSpecializationFormState(isValid);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormField(
                          fillColor: boxColor,
                          controller: profileController.rakController,
                          hintText: 'RAK Unique Code',
                          borderRadius: BorderRadius.circular(10),
                          obscureText: false,
                          cursorColor: white,
                          textcolor: white,
                          inputType: TextInputType.text,
                          textCapitalizationEnabled: false,
                          readOnly: false,
                          length: 50,
                          validator: validateSpecialist,
                        ),
                        SizedBox(height: kheight * 0.05),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Consumer(
                            builder: (context, watch, child) {
                              return CustomButton(
                                text: "No i don't have one",
                                textSize: getResponsiveFontSize(context, 14),
                                textColor: profileController.isAddLaterSelected
                                    ? black
                                    : white,
                                backgroundColor:
                                    profileController.isAddLaterSelected
                                        ? secondaryColor
                                        : Colors.transparent,
                                borderRadius: 30.0,
                                borderColor:
                                    profileController.isAddLaterSelected
                                        ? secondaryColor
                                        : secondaryColor,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: kwidth * 0.4,
                                onPress: () {
                                  profileController
                                      .toggleAddLaterSelection(); // Toggle the button state
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: kheight * 0.1),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CoachProfileOpenforCoach(),
                                  ),
                                );
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
                                  color: profileController
                                          .isSpecializationFormValid
                                      ? primaryColor
                                      : grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    profileController.isSpecializationFormValid
                                        ? primaryColor
                                        : Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: 'Finish',
                                    color: profileController
                                            .isSpecializationFormValid
                                        ? white
                                        : grey,
                                    fontSize:
                                        getResponsiveFontSize(context, 14),
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(width: kwidth * 0.02),
                                 
                                ],
                              ),
                            ),
                          ),
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
