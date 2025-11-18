import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split(".").last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        dividerColor: Colors.transparent,
        indicatorColor: Theme.of(context).colorScheme.inversePrimary,
        labelColor: Theme.of(context).colorScheme.inversePrimary,
        unselectedLabelColor: Colors.white54,
        tabs: _buildCategoryTabs()
      ),
    );
  }
}
