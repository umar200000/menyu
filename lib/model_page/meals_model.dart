class MealsModel {
  final String id;
  final String categoryId;
  final String title;
  final int price;
  final List<String> ingredients;
  final String description;
  final int preparingTime;
  final List<String> imhUrl;

  MealsModel({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.price,
    required this.ingredients,
    required this.description,
    required this.imhUrl,
    required this.preparingTime,
  });
}

class MealsKeeper {
  List<MealsModel> _list = [
    MealsModel(
      id: "m1",
      title: "Lavash",
      categoryId: "c1",
      price: 30000,
      ingredients: ["go'sht", "pamidor", 'sir', 'hamir'],
      description: "Ajoyib Lavash judda mazzali",
      imhUrl: [
        "assets/images/lavash.jpg",
        "assets/images/lavash2.jpg",
        "assets/images/lavash3.jpg",
        "assets/images/lavash4.jpg"
      ],
      preparingTime: 10,
    ),
    MealsModel(
      id: "m2",
      title: "Burger",
      categoryId: "c1",
      price: 35000,
      ingredients: ["go'sht", "pamidor", 'sir', 'non'],
      description: "Ajoyib Burger judda mazzali",
      imhUrl: [
        "assets/images/burger.jpg",
        "assets/images/burger2.jpg",
        "assets/images/burger3.jpg"
      ],
      preparingTime: 15,
    ),
    MealsModel(
      id: "m3",
      title: "Hot-Dog",
      categoryId: "c1",
      price: 20000,
      ingredients: ["sasiska", "pamidor", 'sir', 'non'],
      description: "Ajoyib Hot-dog judda mazzali",
      imhUrl: ["assets/images/hotdog.jpg", 'assets/images/hutdog2.jpg'],
      preparingTime: 10,
    ),
    MealsModel(
      id: "m4",
      title: "Pishloqli Pizza",
      categoryId: "c2",
      price: 55000,
      ingredients: ['sir', 'hamir'],
      description: "Ajoyib Pishloqli Pizza judda mazzali",
      imhUrl: ["assets/images/pizzaSrliy.jpg", "assets/images/paparoni2.jpg"],
      preparingTime: 10,
    ),
    MealsModel(
      id: "m5",
      title: "pepperoni Pizza",
      categoryId: "c2",
      price: 65000,
      ingredients: ["kalbasa", 'sir', 'hamir'],
      description: "Ajoyib pepperoni Pizza judda mazzali",
      imhUrl: ["assets/images/pitsa.jpg", "assets/images/paparoni2.jpg"],
      preparingTime: 10,
    ),
    MealsModel(
      id: "m6",
      title: "Qo'ziqorinliy Pizza",
      categoryId: "c2",
      price: 60000,
      ingredients: ["qo'ziqorin", 'sir', 'hamir'],
      description: "Ajoyib Qo'ziqorinliy Pizza judda mazzali",
      imhUrl: [
        "assets/images/pizzaQoziqorinli.jpg",
        'assets/images/paparoni2.jpg'
      ],
      preparingTime: 10,
    ),
    MealsModel(
      id: "m7",
      title: "To'y Oshi",
      categoryId: "c3",
      price: 25000,
      ingredients: ["guruch", "go'sht", 'sabzi'],
      description: "Ajoyib To'y Oshi judda mazzali",
      imhUrl: [
        "assets/images/hoji.jpg",
        "assets/images/osh2.jpg",
      ],
      preparingTime: 5,
    ),
    MealsModel(
      id: "m8",
      title: "Somsa",
      categoryId: "c3",
      price: 7000,
      ingredients: ["go'sht", 'piyoz', "hamir"],
      description: "Ajoyib Somsa judda mazzali",
      imhUrl: ["assets/images/somsa.jpg"],
      preparingTime: 5,
    ),
    MealsModel(
      id: "m9",
      title: "Olchali Piro'k",
      categoryId: "c5",
      price: 40000,
      ingredients: ["shikolat", "krem", "olcha"],
      description: "Ajoyib Olchali Piro'k judda mazzali",
      imhUrl: [
        "assets/images/shirinliklar.jpg",
        "assets/images/shirinlik2.jpg"
      ],
      preparingTime: 3,
    ),
    MealsModel(
      id: "m10",
      title: "Tvaro'kli Piro'k",
      categoryId: "c5",
      price: 35000,
      ingredients: ["tavro'k", "hamir"],
      description: "Ajoyib Tvaro'kli Piro'k judda mazzali",
      imhUrl: ["assets/images/pirok.jpg", 'assets/images/shirinlik2.jpg'],
      preparingTime: 3,
    ),
    MealsModel(
      id: "m11",
      title: "Cola",
      categoryId: "c6",
      price: 7000,
      ingredients: ["shakar"],
      description: "Muzdekina Cola",
      imhUrl: ["assets/images/kola10.jpg", "assets/images/kola2.jpg"],
      preparingTime: 3,
    ),
  ];
  List<MealsModel> _favorite = [];
  get mealsList => _list;
  List<MealsModel> favoriteMealsList() => _favorite;

  void toggleLike10(String id, int a) {
    final index10 = _favorite.indexWhere((element) => element.id == id);
    if (index10 < 0) {
      print(a);
      a >= 0
          ? _favorite.insert(a, _list.firstWhere((element) => element.id == id))
          : _favorite.add(_list.firstWhere((element) => element.id == id));
    } else {
      _favorite.removeWhere((element) => element.id == id);
    }
  }

  void addMeal(MealsModel meal) {
    _list.add(meal);
  }

  void deleteMeal(String id) {
    _list.removeWhere((element) => element.id == id);
    // _favorite.removeWhere((element) => element.id == id);
  }
}
