class MealsModel {
  final String id;
  final String categoryId;
  final String title;
  final int price;
  final List<String> ingredients;
  final String description;
  final int preparingTime;
  final String imhUrl;
  bool isLike;

  MealsModel({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.price,
    required this.ingredients,
    required this.description,
    required this.imhUrl,
    required this.preparingTime,
    this.isLike = false,
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
      imhUrl: "assets/images/lavash.jpg",
      preparingTime: 10,
    ),
    MealsModel(
      id: "m2",
      title: "Burger",
      categoryId: "c1",
      price: 35000,
      ingredients: ["go'sht", "pamidor", 'sir', 'non'],
      description: "Ajoyib Burger judda mazzali",
      imhUrl: "assets/images/burger.jpg",
      preparingTime: 15,
    ),
    MealsModel(
      id: "m3",
      title: "Hot-Dog",
      categoryId: "c1",
      price: 20000,
      ingredients: ["sasiska", "pamidor", 'sir', 'non'],
      description: "Ajoyib Hot-dog judda mazzali",
      imhUrl: "assets/images/hotdog.jpg",
      preparingTime: 10,
    ),
    MealsModel(
      id: "m4",
      title: "Pishloqli Pizza",
      categoryId: "c2",
      price: 55000,
      ingredients: ['sir', 'hamir'],
      description: "Ajoyib Pishloqli Pizza judda mazzali",
      imhUrl: "assets/images/pizzaSrliy.jpg",
      preparingTime: 10,
    ),
    MealsModel(
      id: "m5",
      title: "pepperoni Pizza",
      categoryId: "c2",
      price: 65000,
      ingredients: ["kalbasa", 'sir', 'hamir'],
      description: "Ajoyib pepperoni Pizza judda mazzali",
      imhUrl: "assets/images/pitsa.jpg",
      preparingTime: 10,
    ),
    MealsModel(
      id: "m6",
      title: "Qo'ziqorinliy Pizza",
      categoryId: "c2",
      price: 60000,
      ingredients: ["qo'ziqorin", 'sir', 'hamir'],
      description: "Ajoyib Qo'ziqorinliy Pizza judda mazzali",
      imhUrl: "assets/images/pizzaQoziqorinli.jpg",
      preparingTime: 10,
    ),
    MealsModel(
      id: "m7",
      title: "To'y Oshi",
      categoryId: "c3",
      price: 25000,
      ingredients: ["guruch", "go'sht", 'sabzi'],
      description: "Ajoyib To'y Oshi judda mazzali",
      imhUrl: "assets/images/hoji.jpg",
      preparingTime: 5,
    ),
    MealsModel(
      id: "m8",
      title: "Somsa",
      categoryId: "c3",
      price: 7000,
      ingredients: ["go'sht", 'piyoz', "hamir"],
      description: "Ajoyib Somsa judda mazzali",
      imhUrl: "assets/images/somsa.jpg",
      preparingTime: 5,
    ),
    MealsModel(
      id: "m9",
      title: "Olchali Piro'k",
      categoryId: "c5",
      price: 40000,
      ingredients: ["shikolat", "krem", "olcha"],
      description: "Ajoyib Olchali Piro'k judda mazzali",
      imhUrl: "assets/images/shirinliklar.jpg",
      preparingTime: 3,
    ),
    MealsModel(
      id: "m10",
      title: "Tvaro'kli Piro'k",
      categoryId: "c5",
      price: 35000,
      ingredients: ["tavro'k", "hamir"],
      description: "Ajoyib Tvaro'kli Piro'k judda mazzali",
      imhUrl: "assets/images/pirok.jpg",
      preparingTime: 3,
    ),
    MealsModel(
      id: "m11",
      title: "Cola",
      categoryId: "c6",
      price: 7000,
      ingredients: ["shakar"],
      description: "Muzdekina Cola",
      imhUrl: "assets/images/kola10.jpg",
      preparingTime: 3,
    ),
  ];
  get mealsList => _list;
}
