import 'package:badminton/common/common_button.dart';
import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/common/common_text_form_field.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/core/utils/validations.dart';
import 'package:badminton/modules/coach_module/coach_team_management/controller/team_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTeamScreenTwo extends ConsumerStatefulWidget {
  const CreateTeamScreenTwo({super.key});

  @override
  _CreateTeamScreenTwoState createState() => _CreateTeamScreenTwoState();
}

class _CreateTeamScreenTwoState extends ConsumerState<CreateTeamScreenTwo> {
  Color _selectedColor = primaryColor;
  bool _isColorSelected = false;
  @override
  void initState() {
    super.initState();
    // Clear the text controllers and reset color picker selection when initializing
    // final createteamcontroller = ref.read(createteamControllerProvider);
    // createteamcontroller.teamnameController.clear();
    // createteamcontroller.teamcolorController.clear();
    // _selectedColor = secondaryColor;
    // _isColorSelected = false;
  }

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.brown,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.cyan,
    Colors.lime,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  
  ];
  @override
  Widget build(BuildContext context) {
    final kheight = MediaQuery.of(context).size.height;
    final kwidth = MediaQuery.of(context).size.width;
    final createteamcontroller = ref.watch(createteamControllerProvider);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: CustomText(
          text: 'New Team',
          color: white,
          fontSize: getResponsiveFontSize(context, 18),
          fontWeight: FontWeight.w700,
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
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kwidth * 0.04, vertical: kheight * 0.045),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topLeft,
                      heightFactor: 0.1,
                      widthFactor: 0.9,
                      child: SizedBox(
                        height: kheight * 0.3,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/bg_images/Looper BG.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  CustomFormField(
                    fillColor: boxColor,
                    controller: createteamcontroller.teamnameController,
                    label: 'Enter Team Name',
                    hintText: 'Enter Team Name',
                    borderRadius: BorderRadius.circular(20),
                    obscureText: false,
                    cursorColor: white,
                    textcolor: white,
                    inputType: TextInputType.name,
                    textCapitalizationEnabled: false,
                    readOnly: false,
                    length: 50,
                    validator: validateteamName,
                  ),
                ],
              ),
              kHeight(context, 0.02),
              CustomText(
                text: 'Pick a team color',
                color: white,
                fontSize: getResponsiveFontSize(context, 16),
                fontWeight: FontWeight.w400,
              ),
              kHeight(context, 0.02),
              // Inside your `Column` where the ListView is:
              SizedBox(
                height: kheight * 0.07,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                    crossAxisSpacing: kwidth * 0.05,
                    mainAxisSpacing: kheight * 0.01,
                    childAspectRatio: 1,
                  ),
                  itemCount: 20,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: kheight * 0.05,
                      width: kwidth * 0.05,
                      decoration: BoxDecoration(
                        color: colors[index],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  },
                ),
              ),

              kHeight(context, 0.02),
              CustomButton(
                text: 'Save',
                textSize: getResponsiveFontSize(context, 16),
                textColor: _isColorSelected ? black : white,
                backgroundColor: primaryColor,
                borderRadius: 15.0,
                borderColor: white,
                height: MediaQuery.of(context).size.height * 0.075,
                width: double.infinity,
                onPress: _isColorSelected
                    ? () {
                        // createteamcontroller.teamcolorController.text = colorToHex(_selectedColor);
                        // createteamcontroller.createTeam();
                        Navigator.pop(context, true);
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
