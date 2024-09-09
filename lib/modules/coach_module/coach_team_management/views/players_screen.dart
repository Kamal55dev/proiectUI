import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/coach_module/coach_team_management/views/add_players.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TeamDetailsScreen using ConsumerStatefulWidget
class PlayersScreen extends ConsumerStatefulWidget {
  const PlayersScreen({super.key});

  @override
  _PlayersScreenState createState() => _PlayersScreenState();
}

class _PlayersScreenState extends ConsumerState<PlayersScreen> {
  @override
  Widget build(BuildContext context) {
    final kheight = MediaQuery.of(context).size.height;
    final kwidth = MediaQuery.of(context).size.width;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: 'Players',
            color: white,
            fontSize: getResponsiveFontSize(context, 16),
            fontWeight: FontWeight.w400,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPlayerScreen(
                             
                            )),
                  );
            },
            child: CustomText(
              text: 'Add Players',
              color: primaryColor,
              fontSize: getResponsiveFontSize(context, 16),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      SizedBox(height: kheight*0.02,),
      // kHeight(context, 0*06),
   SizedBox(
  child: ListView.builder(
    shrinkWrap: true,
    itemCount: 10,
    physics: const ScrollPhysics(),
    itemBuilder: (BuildContext context, index) {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: kheight * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: kwidth * 0.05,
                    backgroundImage: const AssetImage(
                      'assets/images/coach_images/Avatar.png',
                    ) as ImageProvider,
                  ),
                ),
                SizedBox(width: kwidth * 0.04),
                Center(
                  child: CustomText(
                    text: "players.name",
                    color: white,
                    fontSize: getResponsiveFontSize(context, 14),
                  ),
                ),
                const Spacer(),
                Center(
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: white,
                    size: kwidth * 0.06,
                  ),
                ),
              ],
            ),
          ),
        
            Divider(
              color: Colors.grey, 
              thickness: 1,
              height: kheight*0.001, 
            ),
        ],
      );
    },
  ),
)


    ]);
  }
}
