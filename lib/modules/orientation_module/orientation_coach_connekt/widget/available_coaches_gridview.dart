import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CoachGridView extends StatefulWidget {
  final List<CoachData> coaches;
  final Function(CoachData) onCoachTap;

  const CoachGridView({
    Key? key,
    required this.coaches,
    required this.onCoachTap,
  }) : super(key: key);

  @override
  State<CoachGridView> createState() => _CoachGridViewState();
}

class _CoachGridViewState extends State<CoachGridView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: size.width * 0.03,
        mainAxisSpacing: size.width * 0.03,
      ),
      itemCount: widget.coaches.length,
      itemBuilder: (context, index) {
        final coach = widget.coaches[index];
        return GestureDetector(
          onTap: () => widget.onCoachTap(coach),
          child: Card(
            color: const Color(0xFF292B2F),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: size.width * 0.1,
                      backgroundImage: AssetImage(coach.imageUrl),
                      backgroundColor: Colors.white,
                    ),
                    Positioned(
                      bottom: 4,
                      right: 8,
                      child: Container(
                        width: size.width * 0.05,
                        height: size.width * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                CustomText(
                  text: 'Mulyo Handoyo',
                  textAlign: TextAlign.justify,
                  fontSize: getResponsiveFontSize(context, 14),
                  color: white,
                  fontWeight: FontWeight.w400,
                ),
                // Text(
                //   coach.name,
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: size.width * 0.04,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                SizedBox(height: size.height * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on,
                        color: Colors.white, size: size.width * 0.04),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      coach.location,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.03,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CoachData {
  final String name;
  final String imageUrl;
  final String location;

  CoachData(
      {required this.name, required this.imageUrl, required this.location});
}
