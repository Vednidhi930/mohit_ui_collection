class CategoryForYouModel {
  late int id;
  late String image;

  CategoryForYouModel({required this.id, required this.image});
}

List<CategoryForYouModel> categoryForYouData = [
  CategoryForYouModel(
    id: 7,
    image: '/assets/images/apps/ecommerce/category_for_you/1.jpg',
  ),
  CategoryForYouModel(
      id: 3, image: '/assets/images/apps/ecommerce/category_for_you/2.jpg'),
  CategoryForYouModel(
      id: 5, image: '/assets/images/apps/ecommerce/category_for_you/3.jpg'),
  CategoryForYouModel(
      id: 2, image: '/assets/images/apps/ecommerce/category_for_you/4.jpg'),
  CategoryForYouModel(
      id: 8, image: '/assets/images/apps/ecommerce/category_for_you/5.jpg'),
];
