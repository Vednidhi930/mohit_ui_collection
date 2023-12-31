import 'dart:core';

import 'package:mohit_ui_collection/const/consts.dart';
import 'package:mohit_ui_collection/d/themes/theme11/utils/T11Images.dart';
import 'package:mohit_ui_collection/d/themes/theme12/utils/t12_images.dart';
import 'package:mohit_ui_collection/d/themes/theme14/utils/T14Images.dart';

import '../model/T3_Model.dart';
import 'T3Images.dart';

List<T3DashboardSliderModel> getDashboardSlider() {
  List<T3DashboardSliderModel> list = [];
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg",
      "Fast Food", "John smith", pizza, t14_profile2));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg",
      "Fast Food", "John smith", pizza, t14_profile2));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg",
      "Fast Food", "John smith", pizza, t14_profile2));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg",
      "Fast Food", "John smith", pizza, t14_profile2));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg",
      "Fast Food", "John smith", pizza, t14_profile2));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg",
      "Fast Food", "John smith", pizza, t14_profile2));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg",
      "Fast Food", "John smith", pizza, t14_profile2));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg",
      "Fast Food", "John smith", pizza, t14_profile2));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg",
      "Fast Food", "John smith", pizza, t14_profile2));
  list.add(T3DashboardSliderModel("Delicious Italian Pizzas", "Veg",
      "Fast Food", "John smith", pizza, t14_profile2));

  return list;
}

List<Theme3Dish> getDashboardList() {
  List<Theme3Dish> list = [];
  Theme3Dish model1 = Theme3Dish();
  model1.dishName = "Cheese roll Recipe by";
  model1.name = "Rajiv Kapoor";
  model1.dishImage = cheese_roll;

  Theme3Dish model2 = Theme3Dish();
  model2.dishName = "Masala Dhosa Recipe by";
  model2.name = "John doe";
  model2.dishImage = masala_dosa;

  Theme3Dish model3 = Theme3Dish();
  model3.dishName = "Butter Dhosa Recipe by";
  model3.name = "Alice Denial";
  model3.dishImage = masala_dosa;
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  list.add(model3);
  return list;
}

List<Theme3Dish> getList() {
  List<Theme3Dish> list = [];
  Theme3Dish model1 = Theme3Dish();
  model1.dishName = "Cheese roll Recipe by Jon Doe";
  model1.description = Mohit_UI_KitShortText;
  model1.dishImage = cheese_roll;

  Theme3Dish model2 = Theme3Dish();
  model2.dishName = "Masala Dhosa Recipe by Jon Doe";
  model2.description = Mohit_UI_KitShortText;
  model2.dishImage = masala_dosa;

  Theme3Dish model3 = Theme3Dish();
  model3.dishName = "Masala Dhosa Recipe by Jon Doe";
  model3.description = Mohit_UI_KitShortText;
  model3.dishImage = masala_dosa;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);

  return list;
}

List<Theme3Dish> getSearchData() {
  List<Theme3Dish> list = [];
  Theme3Dish model1 = Theme3Dish();
  model1.dishName = "Cheese roll";
  model1.description = "Total 21 Hours";
  model1.dishImage = cheese_roll;

  Theme3Dish model2 = Theme3Dish();
  model2.dishName = "Masala Dhosa";
  model2.description = "Total 21 Hours";
  model2.dishImage = masala_dosa;

  Theme3Dish model3 = Theme3Dish();
  model3.dishName = "Pizza";
  model3.description = "Total 21 Hours";
  model3.dishImage = pizza;

  Theme3Dish model4 = Theme3Dish();
  model4.dishName = "Pizza";
  model4.description = "Total 21 Hours";
  model4.dishImage = pizza;

  Theme3Dish model5 = Theme3Dish();
  model5.dishName = "Pizza";
  model5.description = "Total 21 Hours";
  model5.dishImage = pizza;

  Theme3Dish model6 = Theme3Dish();
  model6.dishName = "Pizza";
  model6.description = "Total 21 Hours";
  model6.dishImage = pizza;

  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  list.add(model6);
  list.add(model1);

  return list;
}

List<Theme3Follower> getFollowers() {
  List<Theme3Follower> list = [];

  Theme3Follower model1 = Theme3Follower();
  model1.location = "California";
  model1.name = "John Vinaa";
  model1.userImg = t14_profile1;

  Theme3Follower model2 = Theme3Follower();
  model2.location = "California";
  model2.name = "John doe";
  model2.userImg = t14_profile2;

  Theme3Follower model3 = Theme3Follower();
  model3.location = "California";
  model3.name = "Alexender Cinah";
  model3.userImg = t14_profile3;

  Theme3Follower model4 = Theme3Follower();
  model4.location = "California";
  model4.name = "Tim Svages";
  model4.userImg = t14_profile4;

  Theme3Follower model5 = Theme3Follower();
  model5.location = "California";
  model5.name = "Brust Var";
  model5.userImg = t12_profile;

  list.add(model2);
  list.add(model1);
  list.add(model3);
  list.add(model4);
  list.add(model5);

  return list;
}
