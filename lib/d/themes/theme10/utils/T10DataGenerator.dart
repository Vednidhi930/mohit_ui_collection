import 'package:mohit_ui_collection/d/themes/theme14/utils/T14Images.dart';

import '../../../../const/images.dart';
import '../models/T10Models.dart';
import 'T10Images.dart';

List<T10Product> getProducts() {
  List<T10Product> list = [];
  list.add(T10Product(
      "Nike Shoes", "\$250", "\$350", product19, "By Boots Category"));
  list.add(
      T10Product("Headset", "\$50", "\$100", product20, "By Headset Category"));
  list.add(T10Product("Pot", "\$20", "\$30", product74, "By Pots Category"));
  list.add(
      T10Product("Watch", "\$250", "\$350", product58, "By Watch Category"));
  return list;
}

List<T10Product> getDashboardProducts() {
  List<T10Product> list = [];
  list.add(T10Product(
      "Nike Shoes", "\$250", "\$350", product1, "By Boots Category"));
  list.add(
      T10Product("Headset", "\$50", "\$100", product12, "By Headset Category"));
  list.add(T10Product("Pot", "\$20", "\$30", product17, "By Pots Category"));
  list.add(
      T10Product("Watch", "\$250", "\$350", product60, "By Watch Category"));
  list.add(
      T10Product("Headset", "\$50", "\$100", product28, "By Headset Category"));
  list.add(T10Product("Pot", "\$20", "\$30", product62, "By Pots Category"));
  list.add(
      T10Product("Watch", "\$250", "\$350", product28, "By Watch Category"));
  list.add(
      T10Product("Watch", "\$250", "\$350", product41, "By Watch Category"));
  return list;
}

List<T10Images> getProfile() {
  List<T10Images> list = [];
  list.add(T10Images(t14_profile1));
  list.add(T10Images(t14_profile2));
  list.add(T10Images(t14_profile3));
  list.add(T10Images(t14_profile4));
  list.add(T10Images(t14_profile1));
  return list;
}

List<T10Images> getDashboard() {
  List<T10Images> list = [];
  list.add(T10Images(banner1));
  list.add(T10Images(banner2));
  list.add(T10Images(banner3));
  list.add(T10Images(banner4));
  list.add(T10Images(banner5));
  return list;
}
