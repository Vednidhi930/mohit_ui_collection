import 'package:mohit_ui_collection/const/consts.dart';

import '../models/T4Models.dart';
import 'T4Colors.dart';
import 'T4Images.dart';

List<T4NewsModel> getList1Data() {
  List<T4NewsModel> list = [];
  var model1 = T4NewsModel();
  model1.name = "Life Speed Racer";
  model1.info = "7th aug- 3 min read";
  model1.image = city2;
  model1.otherinfo = Mohit_UI_KitShortText;

  var model2 = T4NewsModel();
  model2.name = "Move The World";
  model2.info = "7th aug- 3 min read";
  model2.image = city1;
  model2.otherinfo = Mohit_UI_KitShortText;

  var model3 = T4NewsModel();
  model3.name = "Piece Of Pie";
  model3.info = "7th aug- 3 min read";
  model3.image = city3;
  model3.otherinfo = Mohit_UI_KitShortText;

  var model4 = T4NewsModel();
  model4.name = "The Addams Family";
  model4.info = "7th aug- 3 min read";
  model4.image = city1;
  model4.otherinfo = Mohit_UI_KitShortText;

  var model5 = T4NewsModel();
  model5.name = "Life Speed Racer";
  model5.info = "7th aug- 3 min read";
  model5.image = city2;
  model5.otherinfo = Mohit_UI_KitShortText;

  list.add(model1);
  list.add(model3);
  list.add(model2);
  list.add(model4);
  list.add(model5);
  list.add(model5);
  list.add(model1);
  list.add(model3);
  list.add(model2);
  list.add(model4);
  list.add(model5);
  list.add(model5);
  return list;
}

List<T4NewsModel> getCategoryData() {
  List<T4NewsModel> list = [];
  var model1 = T4NewsModel();
  model1.category = "World";
  model1.color = t4_cat1;

  var model2 = T4NewsModel();
  model2.category = "Politics";
  model2.color = t4_cat2;
  var model3 = T4NewsModel();
  model3.category = "Tech";
  model3.color = t4_cat3;
  var model4 = T4NewsModel();
  model4.category = "Sports";
  model4.color = t4_cat4;
  var model5 = T4NewsModel();
  model5.category = "Science";
  model5.color = t4_cat5;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  return list;
}

List<T4NewsModel> getList2Data() {
  List<T4NewsModel> list = [];
  var model1 = T4NewsModel();
  model1.name = "Life Speed Racer";
  model1.info = "7th aug- 3 min read";
  model1.image = city2;

  var model2 = T4NewsModel();
  model2.name = "Life Speed Racer";
  model2.info = "7th aug- 3 min read";
  model2.image = city1;

  var model3 = T4NewsModel();
  model3.name = "Life Speed Racer";
  model3.info = "7th aug- 3 min read";
  model3.image = city3;

  list.add(model2);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model1);
  return list;
}

List<T4NewsModel> getDashboardData() {
  List<T4NewsModel> list = [];
  var model1 = T4NewsModel();
  model1.name = "Life Speed Racer";
  model1.info = "7th aug- 3 min read";
  model1.image = city1;

  var model2 = T4NewsModel();
  model2.name = "Life Speed Racer";
  model2.info = "7th aug- 3 min read";
  model2.image = city2;

  var model3 = T4NewsModel();
  model3.name = "Life Speed Racer";
  model3.info = "7th aug- 3 min read";
  model3.image = city3;

  var model4 = T4NewsModel();
  model4.name = "Life Speed Racer";
  model4.info = "7th aug- 3 min read";
  model4.image = city1;

  var model5 = T4NewsModel();
  model5.name = "Life Speed Racer";
  model5.info = "7th aug- 3 min read";
  model5.image = city2;

  var model6 = T4NewsModel();
  model6.name = "Life Speed Racer";
  model6.info = "7th aug- 3 min read";
  model6.image = city3;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model6);
  list.add(model5);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model6);
  list.add(model5);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model6);
  list.add(model5);
  return list;
}
