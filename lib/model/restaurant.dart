import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/cart_item.dart';
import 'package:food_delivery_app/model/food.dart';

class Restaurant extends ChangeNotifier {
  // === getters ===

  List<Food> get menu => _menu;

  // === operations ===

  //TODO: add to cart

  final List<CartItem> _cart = [];

  void addToCart(Food food, List<AddOn> selectedAddons) {
    //see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;
      //check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddon, selectedAddons);

      return isSameFood && isSameAddons;
    });

    //if items already exist, add its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // otherwise add new cart item to cart
    else {
      _cart.add(CartItem(food: food, selectedAddon: selectedAddons));
    }

    notifyListeners();
  }

  //TODO: remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (_cart[cartIndex].quantity > 1) {
      _cart[cartIndex].quantity--;
    } else {
      _cart.removeAt(cartIndex);
    }
    notifyListeners();
  }

  //TODO: get total price
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (AddOn addon in cartItem.selectedAddon) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //TODO: get total number
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //TODO: clear items in cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
  // === helper ===

  //TODO: receipt generator
  //TODO: format double value to money
  //TODO: format list of addons to a string summary

  final List<Food> _menu = [
    // burgir
    Food(
      name: "Black Burgers",
      description:
          "A unique burger with striking black buns and a premium beef patty.",
      imagePath: "lib/assets/images/burgers/black-burgers.jpg",
      price: 35000,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: "Extra Bacon", price: 7000),
        AddOn(name: "Extra Black Bun", price: 5000),
        AddOn(name: "Spicy Sauce", price: 3000),
      ],
    ),
    Food(
      name: "Cheese Burgers",
      description:
          "The classic burger featuring a juicy patty and a thick slice of melted cheddar.",
      imagePath: "lib/assets/images/burgers/cheese-burgers.jpg",
      price: 30000,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: "Extra Cheese", price: 4000),
        AddOn(name: "Extra Patty", price: 8000),
        AddOn(name: "Pickles", price: 2000),
      ],
    ),
    Food(
      name: "Double Cheeseburgers",
      description:
          "Two beef patties and two layers of cheese for double the satisfaction.",
      imagePath: "lib/assets/images/burgers/double-cheeseburgers.jpg",
      price: 45000,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: "Onion Rings", price: 6000),
        AddOn(name: "Jalapeños", price: 3000),
        AddOn(name: "BBQ Sauce", price: 3000),
      ],
    ),
    Food(
      name: "Gravy Burgers",
      description:
          "A savoury burger drenched in rich brown gravy, served open-faced.",
      imagePath: "lib/assets/images/burgers/gravy-burgers.jpg",
      price: 40000,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: "Extra Gravy", price: 5000),
        AddOn(name: "Mashed Potato", price: 10000),
        AddOn(name: "Mushroom", price: 4000),
      ],
    ),
    Food(
      name: "Veggiful Burgers",
      description:
          "A meatless option packed with fresh vegetables and a hearty veggie patty.",
      imagePath: "lib/assets/images/burgers/veggiful-burgers.jpg",
      price: 32000,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: "Extra Avocado", price: 6000),
        AddOn(name: "Vegan Cheese", price: 5000),
        AddOn(name: "Hummus Spread", price: 4000),
      ],
    ),

    //desserts
    //amai mono ga tabetai
    Food(
      name: "Brownies",
      description: "Fudgy chocolate brownies topped with crunchy walnuts.",
      imagePath: "lib/assets/images/desserts/brownies.jpg",
      price: 18000,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: "Vanilla Ice Cream", price: 8000),
        AddOn(name: "Chocolate Syrup", price: 3000),
        AddOn(name: "Extra Nuts", price: 2000),
      ],
    ),
    Food(
      name: "Cupcakes",
      description:
          "Small cakes with sweet cream frosting and various fun toppings.",
      imagePath: "lib/assets/images/desserts/cupcakes.jpg",
      price: 15000,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: "Sprinkles", price: 1000),
        AddOn(name: "Grated Cheese", price: 2000),
        AddOn(name: "Custom Topping", price: 5000),
      ],
    ),
    Food(
      name: "Donuts",
      description:
          "Soft, ring-shaped dough with sweet glaze or chocolate coating.",
      imagePath: "lib/assets/images/desserts/donuts.jpg",
      price: 12000,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: "Chocolate Glaze", price: 3000),
        AddOn(name: "Strawberry Filling", price: 4000),
        AddOn(name: "Dipping Sauce", price: 2000),
      ],
    ),
    Food(
      name: "Macarons",
      description:
          "Delicate French cookies, crispy on the outside, chewy on the inside, with assorted flavors.",
      imagePath: "lib/assets/images/desserts/macarons.jpg",
      price: 20000,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: "Box Packaging", price: 5000),
        AddOn(name: "Gold Flakes", price: 10000),
        AddOn(name: "Custom Color", price: 3000),
      ],
    ),
    Food(
      name: "Tiramisu",
      description:
          "Classic Italian dessert layered with mascarpone cream, ladyfingers, and coffee.",
      imagePath: "lib/assets/images/desserts/tiramisu.jpg",
      price: 28000,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: "Extra Cocoa Powder", price: 2000),
        AddOn(name: "Liqueur Shot", price: 15000),
        AddOn(name: "Berries", price: 6000),
      ],
    ),

    //dorinkku
    Food(
      name: "Coffee",
      description: "A cup of warm coffee, available as Americano or Latte.",
      imagePath: "lib/assets/images/drinks/coffee.jpg",
      price: 15000,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Extra Shot Espresso", price: 5000),
        AddOn(name: "Vanilla Syrup", price: 4000),
        AddOn(name: "Oat Milk Substitute", price: 7000),
      ],
    ),
    Food(
      name: "Cocktail",
      description:
          "A refreshing non-alcoholic blended beverage with vibrant flavors.",
      imagePath: "lib/assets/images/drinks/cocktail.jpg",
      price: 25000,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Extra Ice", price: 0),
        AddOn(name: "Mint Garnish", price: 2000),
        AddOn(name: "Extra Sweetener", price: 3000),
      ],
    ),
    Food(
      name: "Iced Tea",
      description: "A classic sweet iced tea to quench your thirst.",
      imagePath: "lib/assets/images/drinks/iced-tea.jpg",
      price: 8000,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Lemon Slice", price: 1000),
        AddOn(name: "Less Sugar", price: 0),
        AddOn(name: "Jelly Topping", price: 3000),
      ],
    ),
    Food(
      name: "Soda",
      description:
          "A cold, carbonated soft drink, choice of cola or orange flavor.",
      imagePath: "lib/assets/images/drinks/soda.jpg",
      price: 10000,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Cherry Flavor", price: 3000),
        AddOn(name: "Slushy Ice", price: 5000),
        AddOn(name: "Bigger Size", price: 7000),
      ],
    ),
    Food(
      name: "Water",
      description: "Bottled mineral water for pure hydration.",
      imagePath: "lib/assets/images/drinks/water.jpg",
      price: 5000,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: "Chilled", price: 1000),
        AddOn(name: "Room Temperature", price: 0),
        AddOn(name: "Lemon Infused", price: 4000),
      ],
    ),

    //Shawarmas
    //COME TO ZA BACK, I'LL SHOW YOU
    Food(
      name: "Lamb Shawarma",
      description:
          "Thinly sliced, marinated lamb roasted and wrapped in pita bread.",
      imagePath: "lib/assets/images/shawarma/lamb-shawarma.jpg",
      price: 45000,
      category: FoodCategory.shawarmas,
      availableAddOns: [
        AddOn(name: "Tahini Sauce", price: 4000),
        AddOn(name: "Extra Lamb", price: 12000),
        AddOn(name: "Pickled Turnips", price: 3000),
      ],
    ),
    Food(
      name: "Regular Shawarma",
      description:
          "Standard chicken or beef shawarma with authentic seasoning.",
      imagePath: "lib/assets/images/shawarma/regular-shawarma.jpg",
      price: 38000,
      category: FoodCategory.shawarmas,
      availableAddOns: [
        AddOn(name: "Garlic Sauce", price: 3000),
        AddOn(name: "Hummus", price: 5000),
        AddOn(name: "Extra Salad", price: 2000),
      ],
    ),
    Food(
      name: "Sandwich Shawarma",
      description: "Shawarma meat served inside a fully loaded sandwich roll.",
      imagePath: "lib/assets/images/shawarma/sandwich-shawarma.jpg",
      price: 40000,
      category: FoodCategory.shawarmas,
      availableAddOns: [
        AddOn(name: "Pita Bread Upgrade", price: 5000),
        AddOn(name: "Hot Sauce", price: 2000),
        AddOn(name: "Feta Cheese", price: 6000),
      ],
    ),
    Food(
      name: "Skewer Shawarma",
      description:
          "Marinated shawarma pieces served on a skewer, great with rice or bread.",
      imagePath: "lib/assets/images/shawarma/skewer-shawarma.jpg",
      price: 48000,
      category: FoodCategory.shawarmas,
      availableAddOns: [
        AddOn(name: "Extra Skewer", price: 15000),
        AddOn(name: "Rice Pilaf", price: 10000),
        AddOn(name: "Yogurt Dip", price: 4000),
      ],
    ),
    Food(
      name: "Taco Shawarma",
      description:
          "A fusion dish, serving shawarma meat in a crunchy taco shell.",
      imagePath: "lib/assets/images/shawarma/taco-shawarma.jpg",
      price: 42000,
      category: FoodCategory.shawarmas,
      availableAddOns: [
        AddOn(name: "Guacamole", price: 7000),
        AddOn(name: "Salsa", price: 3000),
        AddOn(name: "Shredded Cheese", price: 4000),
      ],
    ),

    //sides
    //motto oishii okashi
    Food(
      name: "Bread",
      description:
          "Soft pita or toasted bread, perfect for dipping or accompanying main dishes.",
      imagePath: "lib/assets/images/sides/bread.jpg",
      price: 8000,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: "Garlic Butter", price: 4000),
        AddOn(name: "Olive Oil Dip", price: 3000),
        AddOn(name: "Herb Seasoning", price: 2000),
      ],
    ),
    Food(
      name: "Egg",
      description: "A simple side of sunny-side-up or scrambled eggs.",
      imagePath: "lib/assets/images/sides/egg.jpg",
      price: 6000,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: "Sunny Side Up", price: 0),
        AddOn(name: "Omelette Style", price: 2000),
        AddOn(name: "Extra Yolk", price: 1000),
      ],
    ),
    Food(
      name: "French Fries",
      description:
          "Crispy golden fried potatoes served with your choice of dipping sauce.",
      imagePath: "lib/assets/images/sides/french-fries.jpg",
      price: 15000,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: "Cheese Sauce", price: 5000),
        AddOn(name: "Truffle Oil", price: 8000),
        AddOn(name: "Spicy Mayo", price: 3000),
      ],
    ),
    Food(
      name: "Nuggets",
      description: "Crispy chicken nuggets, a popular and satisfying side.",
      imagePath: "lib/assets/images/sides/nuggets.jpg",
      price: 20000,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: "Extra Dipping Sauce", price: 2000),
        AddOn(name: "5 Pcs Extra", price: 15000),
        AddOn(name: "Lemon Pepper Seasoning", price: 4000),
      ],
    ),
    Food(
      name: "Potato Chips",
      description: "Thinly sliced, crunchy potato chips with savory seasoning.",
      imagePath: "lib/assets/images/sides/potato-chips.jpg",
      price: 12000,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: "Sour Cream Dip", price: 5000),
        AddOn(name: "Cheddar Seasoning", price: 3000),
        AddOn(name: "Large Bag", price: 8000),
      ],
    ),
  ];
}
