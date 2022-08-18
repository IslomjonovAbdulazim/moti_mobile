class MotiProductModel {
  late String name;
  late String title;
  late double price;
  late bool isLiked;
  late String imagePath;

  MotiProductModel({
    required this.name,
    required this.isLiked,
    required this.price,
    required this.title,
    required this.imagePath,
  });
}
