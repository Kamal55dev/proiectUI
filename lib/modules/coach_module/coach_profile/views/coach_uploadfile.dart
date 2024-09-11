import 'package:badminton/common/common_button.dart';
import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/common/common_text_form_field.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/coach_module/coach_profile/controllers/coach_profile_controller.dart';
import 'package:badminton/modules/coach_module/coach_profile/views/coach_specialization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachProfileUploadFile extends ConsumerStatefulWidget {
  const CoachProfileUploadFile({super.key});

  @override
  _CoachProfileUploadFileState createState() => _CoachProfileUploadFileState();
}

class _CoachProfileUploadFileState
    extends ConsumerState<CoachProfileUploadFile> {
  List<PlatformFile> _selectedFiles =
      []; // State to keep track of selected files

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg'],
      withData: true,
    );

    if (result != null && result.files.length <= 2) {
      setState(() {
        _selectedFiles = result.files;
      });

      for (var file in _selectedFiles) {
        print("Selected file: ${file.name}");
      }
    } else if (result != null && result.files.length > 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Only 2 files can be selected.")),
      );
    }
  }

  void _removeFile(int index) {
    setState(() {
      _selectedFiles.removeAt(index);
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
                    horizontal: kwidth * 0.02,
                    vertical: kheight * 0.045,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Do you have any coaching certificate?',
                        color: white,
                        fontSize: getResponsiveFontSize(context, 16),
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: kheight * 0.04),
                      CustomFormField(
                        fillColor: boxColor,
                        controller: profileController.certificatesController,
                        hintText: 'Upload File ',
                        borderRadius: BorderRadius.circular(10),
                        obscureText: false,
                        cursorColor: white,
                        textcolor: white,
                        inputType: TextInputType.emailAddress,
                        textCapitalizationEnabled: false,
                        readOnly: false,
                        length: 50,
                        child: GestureDetector(
                          onTap: () async {
                            await _pickFiles();
                          },
                          child: Icon(
                            Icons.file_upload_outlined,
                            color: white,
                            size: kwidth * 0.06,
                          ),
                        ),
                      ),
                      SizedBox(height: kheight * 0.01),
                      CustomText(
                        text:
                            'Only .pdf,.jpg are allowed. Max file size is 2 MB, Max number of files is restricted to 2',
                        color: grey,
                        fontSize: getResponsiveFontSize(context, 14),
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: kheight * 0.05),
                      if (_selectedFiles.isNotEmpty)
                        SizedBox(height: kheight * 0.02),
                      Column(
                        children:
                            _selectedFiles.asMap().entries.expand((entry) {
                          int index = entry.key;
                          PlatformFile file = entry.value;
                          return [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Image.asset(
                                'assets/images/coach_images/Personal Info.png',
                                height: kheight * 0.05,
                                width: kwidth * 0.08,
                                fit: BoxFit.contain,
                              ),
                              title: CustomText(
                                text: file.name,
                                color: white,
                                fontSize: getResponsiveFontSize(context, 14),
                              ),
                              trailing: IconButton(
                                icon: Image.asset(
                                  'assets/images/coach_images/Vector.png',
                                  height: kheight * 0.03,
                                  width: kwidth * 0.04,
                                  fit: BoxFit.contain,
                                ),
                                onPressed: () => _removeFile(index),
                              ),
                            ),
                            Divider(
                              color: white, // Adjust color as needed
                              thickness: kheight * 0.002,
                            ),
                          ];
                        }).toList(),
                      ),
                      SizedBox(height: kheight * 0.05),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomButton(
                          text: "No I don't",
                          textSize: getResponsiveFontSize(context, 14),
                          textColor:
                              profileController.isfileupload ? black : white,
                          backgroundColor: profileController.isfileupload
                              ? secondaryColor
                              : Colors.transparent,
                          borderRadius: 30.0,
                          borderColor: profileController.isfileupload
                              ? secondaryColor
                              : secondaryColor,
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: kwidth * 0.25,
                          onPress: () {
                            profileController.isfileuploadSelection();
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CoachProfileSpecilization(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kwidth * 0.035),
                              margin: EdgeInsets.only(left: kwidth * 0.02),
                              height: kheight * 0.05,
                              width: kwidth * 0.23,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
