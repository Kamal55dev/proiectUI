import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabIndexProvider = StateProvider<int>((ref) => 0);

class CustomTabBar extends ConsumerStatefulWidget {
  const CustomTabBar({super.key});

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends ConsumerState<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(tabIndexProvider);

    return Column(
      children: [
        // Scrollable TabBar with TabController
        TabBar(
          controller: _tabController,
          isScrollable: true,
          automaticIndicatorColorAdjustment: true,
          dragStartBehavior: DragStartBehavior.start,
          dividerColor: Colors.transparent,
          labelPadding:
              EdgeInsets.symmetric(horizontal: 8.0), // Adjust spacing here
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          tabAlignment: TabAlignment.start,
          unselectedLabelColor: black,
          tabs: [
            _buildTab(context, "New Request", 0, selectedIndex),
            _buildTab(context, "Accepted", 1, selectedIndex),
            _buildTab(context, "Waiting List", 2, selectedIndex),
            _buildTab(context, "Pending", 3, selectedIndex),
          ],
          onTap: (index) {
            ref.read(tabIndexProvider.notifier).state = index;
            _tabController.animateTo(index);
          },
        ),
        // Expanded TabBarView for each tab's content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              Center(child: Text('New Request')),
              Center(child: Text('Accepted')),
              Center(child: Text('Waiting List')),
              Center(child: Text('Pending')),
            ],
          ),
        ),
      ],
    );
  }

  // Function to build individual tabs with spacing
  Widget _buildTab(
      BuildContext context, String text, int index, int selectedIndex) {
    return Tab(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.0), // Space between tabs
        padding: responsivePadding(context,
            horizontalFactor: 0.08, verticalFactor: 0.020),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                selectedIndex == index ? Color(0xFF6B5918) : Colors.transparent,
            border: Border.all(
              color: selectedIndex == index ? Colors.transparent : white,
            ),
            shape: BoxShape.rectangle),
        child: CustomText(
          text: text,
          fontSize: getResponsiveFontSize(context, 12),
          color: selectedIndex == index ? white : white,
        ),
      ),
    );
  }
}
