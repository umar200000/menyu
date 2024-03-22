class CategoriesModel {
  final String id;
  final String title;
  final String imgUrl;

  CategoriesModel({
    required this.id,
    required this.title,
    required this.imgUrl,
  });
}

class Categories {
  List<CategoriesModel> _list = [
    CategoriesModel(
      id: "c1",
      title: "Fast Food",
      imgUrl: "assets/images/fastfood.jpg",
    ),
    CategoriesModel(
      id: "c2",
      title: "Pizza",
      imgUrl: "assets/images/pitsa.jpg",
    ),
    CategoriesModel(
      id: "c3",
      title: "Milliy Tovomlar",
      imgUrl: "assets/images/hoji.jpg",
    ),
    CategoriesModel(
      id: "c4",
      title: "Turk Tovomlar",
      imgUrl: "assets/images/turk.jpg",
    ),
    CategoriesModel(
      id: "c5",
      title: "Shirinliklar",
      imgUrl: "assets/images/shirinliklar.jpg",
    ),
    CategoriesModel(
      id: "c6",
      title: "Ichimliklar",
      imgUrl: "assets/images/ichimlik.jpg",
    ),
  ];

  get categoriesList => _list;
}
