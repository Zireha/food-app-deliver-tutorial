class Food {
  final String name;          //kebab
  final String description;   //mutton wrapped in a bread
  final String imagePath;     //lib/assets/images/kebab.png
  final double price;         //Rp23.000
  final FoodCategory category;//Sides
  List<AddOn> availableAddOns;//[extra mayonnaise, spicy, no mustard]

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddOns,
  });
}

//food category
enum FoodCategory { burgers, shawarmas, sides, desserts, drinks }

//food addons

class AddOn {
  String name;
  double price;

  AddOn({
    required this.name,
    required this.price,
  });
}
