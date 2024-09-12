import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCoachesScreen extends ConsumerStatefulWidget {
  const AddCoachesScreen({
    super.key,
  });

  @override
  ConsumerState<AddCoachesScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends ConsumerState<AddCoachesScreen> {
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final createteamcontroller = ref.watch(createteamControllerProvider);
  //     createteamcontroller.getPlayerList();
  //   });
  //   super.initState();
  // }
  List<String> level = [
    'Advanced',
    'Beginner',
    'Intermediate',
    'Advanced',
    'Beginner',
    'Intermediate',
    'Advanced',
    'Beginner',
    'Intermediate',
    'Advanced'
  ];
  @override
  Widget build(BuildContext context) {
    // final createteamcontroller = ref.watch(createteamControllerProvider);

    var size = MediaQuery.of(context).size;
    final kheight = MediaQuery.of(context).size.height;
    final kwidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgColor,
          title: CustomText(
            text: 'Add Coach',
            color: white,
            fontSize: getResponsiveFontSize(context, 18),
            fontWeight: FontWeight.w500,
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
            child: Column(children: [
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: kwidth * 0.02, vertical: kheight * 0.02),
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(children: [
                TextFormField(
                  // controller: createteamcontroller.teamsearchController,
                  style: TextStyle(
                    color: white,
                    fontSize: getResponsiveFontSize(context, 12),
                  ),
                  decoration: InputDecoration(
                    fillColor: boxColor,
                    filled: true,
                    hintText: 'Search Coach',
                    hintStyle: TextStyle(
                      color: grey,
                      fontSize: getResponsiveFontSize(context, 12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: grey,
                      ),
                    ),
                  ),
                  onChanged: (query) {
                    // createteamcontroller.filterPlayers(query);
                  },
                ),
                kHeight(context, 0.04),
                // createteamcontroller.noResultFound
                //     ? CustomText(
                //         text: "No result",
                //         color: grey,
                //         fontWeight: FontWeight.normal,
                //         fontSize: getResponsiveFontSize(context, 14),
                //       )
                //     :
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        // var player = createteamcontroller
                        //     .filteredPlayerList[index];
                        // final imageUrl = player.displayImage != ""
                        //     ? ApiEndpoints().getProfileImagePath(
                        //         player.userId.toString())
                        //     : null;
                        return IntrinsicHeight(
                          child: Container(
                            margin: EdgeInsets.only(bottom: kheight * 0.01),
                            padding: EdgeInsets.symmetric(
                                horizontal: kwidth * 0.03,
                                vertical: kheight * 0.02),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(57, 82, 81, 81),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: size.width * 0.065,
                                      backgroundImage:
                                          //  imageUrl != null
                                          //     ? NetworkImage(imageUrl)
                                          //     : const
                                          const AssetImage(
                                                  'assets/images/coach_images/Avatar.png')
                                              as ImageProvider,
                                    ),
                                    SizedBox(
                                      width: kwidth * 0.02,
                                    ),
                                    Center(
                                      child: CustomText(
                                        text: "Ruo Chio",
                                        fontSize:
                                            getResponsiveFontSize(context, 16),
                                        color: white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ])),
        ])));
  }
}
