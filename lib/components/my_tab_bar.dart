import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.white60,
        unselectedLabelColor: Theme.of(context).colorScheme.tertiary,
        tabs: [
          //1st tab
          Tab(
            icon: Icon(
              Icons.home_rounded,
              ),
          ),
          //2nd tab
          Tab(
            icon: Icon(
              Icons.settings_rounded,
              ),
          ),
          //2rd tab
          Tab(
            icon: Icon(
              Icons.person_rounded,
              ),
          ),
        ]
        ),
    );
  }
}
