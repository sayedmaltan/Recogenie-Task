class FoodItem {
  final String name;
  final double price;
  final String? imageUrl;

  FoodItem({required this.name, required this.price, this.imageUrl});
}
final List<FoodItem> foodItems = [
  FoodItem(
    name: "Pizza",
    price: 60.0,
    imageUrl:
    'https://ooni.com/cdn/shop/articles/20220211142347-margherita-9920_ba86be55-674e-4f35-8094-2067ab41a671.jpg?v=1737104576',
  ),
  FoodItem(
    name: "Burger",
    price: 45.0,
    imageUrl:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfg9B6xzfanVTpi-C4uuDtjNfBxtZA9KA57w&s',
  ),
  FoodItem(
    name: "Sushi",
    price: 120.0,
    imageUrl:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvXMSP-IUeoq8AFQXb-y2va4gQIF2wQO9yPA&s',
  ),
  FoodItem(
    name: "Pasta",
    price: 55.0,
    imageUrl:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGj5fp8DwKOgB02Y1w-suEvsEg_E0eYYdO_A&s",
  ),
  FoodItem(
    name: "Fried Chicken",
    price: 70.0,
    imageUrl:
    "https://static01.nyt.com/images/2024/11/24/multimedia/Buttermilk-Fried-Chickenrex-vtlk/Buttermilk-Fried-Chickenrex-vtlk-mediumSquareAt3X.jpg",
  ),
  FoodItem(
    name: "Falafel",
    price: 25.0,
    imageUrl:
    "https://hips.hearstapps.com/hmg-prod/images/falafel-index-64e613f5e0f10.jpg?crop=0.888888888888889xw:1xh;center,top&resize=1200:*",
  ),
  FoodItem(
    name: "Koshary",
    price: 35.0,
    imageUrl:
    "https://www.maggiarabia.com/sites/default/files/srh_recipes/24fb7fe4c748e9d1246959766748906d.jpg",
  ),
  FoodItem(
    name: "Shawarma",
    price: 50.0,
    imageUrl:
    "https://foxeslovelemons.com/wp-content/uploads/2023/06/Chicken-Shawarma-8.jpg",
  ),
];
