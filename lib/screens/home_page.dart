import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/model/food.dart';
import 'package:food_delivery_app/model/restaurant.dart';
import 'package:food_delivery_app/components/my_drawer.dart';
import 'package:food_delivery_app/components/my_tab_bar.dart';
import 'package:food_delivery_app/components/my_food_tile.dart';
import 'package:food_delivery_app/components/my_sliver_app_bar.dart';
import 'package:food_delivery_app/components/my_description_box.dart';
import 'package:food_delivery_app/components/my_current_location.dart';

//TODO: Dont forget to add images, it was deleted due to unforeseen circumstances
// (He wasn't focused with his work)

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  //sort and return list of food items per category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      //get menu category
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            //get individual food item
            final food = categoryMenu[index];

            //return food tile
            return MyFoodTile(food: food, onTap: () {});
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //current location
                Divider(
                  indent: 24,
                  endIndent: 24,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const MyCurrentLocation(),
                //description
                const MyDescriptionBox()
              ],
            ),
          )
        ],
        body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu))),
      ),
    );
  }
}
