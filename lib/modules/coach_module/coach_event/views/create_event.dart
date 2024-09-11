import 'package:badminton/common/common_button.dart';
import 'package:badminton/common/common_dropdown.dart';
import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/common/common_text_form_field.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/coach_module/coach_event/controllers/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventCreateScreen extends ConsumerStatefulWidget {
  final List<Map<String, String>>? selectedParticipants;
  // final List<ParticipantModel>? listOfParticipant;
  const EventCreateScreen({
    super.key,
    // this.listOfParticipant,
    this.selectedParticipants,
  });

  @override
  ConsumerState<EventCreateScreen> createState() => _EventCreateScreenState();
}

class _EventCreateScreenState extends ConsumerState<EventCreateScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final eventcontroller = ref.read(eventControllerProvider);
  //     eventcontroller.getEventType();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var kheight = MediaQuery.of(context).size.height;
    var kwidth = MediaQuery.of(context).size.width;
    final selectedValue = ref.watch(dropdownValueProvider);

    final eventcontroller = ref.watch(eventControllerProvider);

    // final participantNames = widget.selectedParticipants
    //         ?.map((participant) => participant['participantId'])
    //         .toList() ??
    //     [];
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: CustomText(
          text: 'New Event',
          fontSize: getResponsiveFontSize(context, 20),
          color: white,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.clear,
                color: white,
                size: kwidth * 0.06,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kwidth * 0.035,
            vertical: kheight * 0.045,
          ),
          child: Column(
            children: [
              CustomFormField(
                fillColor: boxColor,
                controller: eventcontroller.eventController,
                // label: 'License Number',
                hintText: 'Event Name',
                borderRadius: BorderRadius.circular(10),
                obscureText: false,
                cursorColor: white,
                textcolor: white,
                inputType: TextInputType.emailAddress,
                textCapitalizationEnabled: false,
                readOnly: false,
                length: 50,
                // validator: validatelicenseNum,
              ),
              SizedBox(
                height: kheight * 0.03,
              ),
              CustomDropdown(
                borderColor: grey,
                height: kheight * 0.07,
                hintText: 'Event Type',
                hintColor: grey,
                backgroundColor: boxColor,
                customIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: grey,
                  size: 25,
                ),
                value: selectedValue,
                borderRadius: BorderRadius.circular(10),
                items: [
                  'Abc',
                  'Abc',
                  'Abc',
                ],
                // items: eventcontroller.eventTypes
                //     .map((eventType) => eventType.name)
                //     .toList(),
                itemBuilder: (item) => Text(
                  item,
                  style: const TextStyle(
                    fontSize: 12,
                    color: white,
                  ),
                ),
                onChanged: (newValue) {
                  // // Find the selected event type by name and store its ID
                  // final selectedEventType = eventcontroller.eventTypes
                  //     .firstWhere((eventType) => eventType.name == newValue);
                  // eventcontroller.setSelectedEventType(selectedEventType
                  //     .id); // Store the ID (int) in the controller
                },
              ),
              SizedBox(
                height: kheight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'All Day Event',
                    fontSize: getResponsiveFontSize(context, 16),
                    color: white,
                    fontWeight: FontWeight.w400,
                  ),
                  Transform.scale(
          scale: 0.7,
          child: Switch(
            value: eventcontroller.isSwitchOn,
            onChanged: (bool newValue) {
              ref.read(eventControllerProvider).toggleSwitch(newValue);
            },
           thumbColor: const WidgetStatePropertyAll(black),
            activeColor:white, 
            inactiveTrackColor:grey, 
            activeTrackColor: white,
           
          ),
        ),
                ],
              ),
              SizedBox(
                height: kheight * 0.03,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kwidth * 0.06, vertical: kheight * 0.02),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: boxColor,
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Start',
                              fontSize: getResponsiveFontSize(context, 14),
                              color: grey,
                              fontWeight: FontWeight.w400,
                            ),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(eventControllerProvider)
                                    .pickStartDate(context);
                              },
                              child: CustomText(
                                text: ref
                                    .watch(eventControllerProvider)
                                    .getFormattedStartDate(),
                                fontSize: getResponsiveFontSize(context, 16),
                                color: white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(eventControllerProvider)
                                    .pickStartTime(context);
                              },
                              child: CustomText(
                                text: ref
                                    .watch(eventControllerProvider)
                                    .getFormattedStartTime(context),
                                fontSize: getResponsiveFontSize(context, 14),
                                color: grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: kwidth * 0.15,
                        ),
                        Container(
                          color: grey,
                          height: kheight * 0.1,
                          width: kwidth * 0.003,
                        ),
                        SizedBox(
                          width: kwidth * 0.15,
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: 'End',
                              fontSize: getResponsiveFontSize(context, 14),
                              color: grey,
                              fontWeight: FontWeight.w400,
                            ),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(eventControllerProvider)
                                    .pickEndDate(context);
                              },
                              child: CustomText(
                                text: ref
                                    .watch(eventControllerProvider)
                                    .getFormattedEndDate(),
                                fontSize: getResponsiveFontSize(context, 16),
                                color: white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(eventControllerProvider)
                                    .pickEndTime(context);
                              },
                              child: CustomText(
                                text: ref
                                    .watch(eventControllerProvider)
                                    .getFormattedEndTime(context),
                                fontSize: getResponsiveFontSize(context, 14),
                                color: grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: kheight * 0.016),
                    if (ref
                        .watch(eventControllerProvider)
                        .validationMessage
                        .isNotEmpty)
                      Text(
                        ref.watch(eventControllerProvider).validationMessage,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: kheight * 0.03,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: kwidth * 0.016),
                decoration: BoxDecoration(
                  color: boxColor,
                  border: Border.all(color: grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: eventcontroller.addressController,
                  style: const TextStyle(color: white),
                  decoration: InputDecoration(
                    icon: GestureDetector(
                      onTap: () async {
                        // await eventcontroller.determinePosition().toString();
                      },
                      child: Icon(
                        Icons.location_on_outlined,
                        color: grey,
                        size: kwidth * 0.06,
                      ),
                    ),
                    hintText: 'Venue',
                    hintStyle: const TextStyle(color: grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: kheight * 0.03,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: kwidth * 0.016, vertical: kheight * 0.025),
                decoration: BoxDecoration(
                  color: boxColor,
                  border: Border.all(color: grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: eventcontroller.selectedParticipants.isEmpty
                //           ? Text(
                //               'Add Participants',
                //               style: TextStyle(
                //                 color: Colors.grey[400],
                //                 fontSize: 16.0,
                //               ),
                //             )
                //           : Wrap(
                //               spacing: 8.0,
                //               runSpacing: 4.0,
                //               children: eventcontroller.selectedParticipants
                //                   .map((participant) {
                //                 return Chip(
                //                   label: Text(participant.name),
                //                   backgroundColor: Colors.grey[700],
                //                   labelStyle:
                //                       const TextStyle(color: Colors.white),
                //                 );
                //               }).toList(),
                //             ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.of(context).push(
                //           MaterialPageRoute(
                //             builder: (context) => const AddParticipateScreen(),
                //           ),
                //         );
                //       },
                //       child: Icon(
                //         Icons.add,
                //         color: Colors.white,
                //         size: kwidth * 0.06,
                //       ),
                //     ),
                //   ],
                // ),
              ),
              SizedBox(
                height: kheight * 0.03,
              ),
              CustomButton(
                text: 'Creat Event',
                textSize: getResponsiveFontSize(context, 16),
                textColor: grey,
                backgroundColor: bgColor,
                borderColor: grey,
                borderRadius: 12.0,
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                onPress: () {
                  // eventcontroller.submitEvent(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
