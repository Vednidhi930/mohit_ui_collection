import 'package:mohit_ui_collection/d/themes/theme14/utils/T14Images.dart';

import '../model/T13Model.dart';
import 'T13Images.dart';

List<Home> generateFeatured() {
  List<Home> featured = [];
  featured.add(Home.info("London", t14_travel1));
  featured.add(Home.info("Santorini", t14_travel2));
  featured.add(Home.info("Toronto", t14_travel3));
  featured.add(Home.info("Bali", t14_travel1));

  return featured;
}

List<Home> generatePopular() {
  List<Home> popular = [];
  popular.add(Home("Green House", t14_travel1, "\$1500", "20 sqm", "Toronto"));
  popular.add(Home("Lake House", t14_travel2, "\$1500", "20 sqm", "Bali"));
  popular
      .add(Home("Modern House", t14_travel3, "\$1500", "20 sqm", "Santorini"));
  popular.add(Home("Tree House", t14_travel1, "\$1500", "20 sqm", "London"));

  return popular;
}

List<Currency> generateCurrency() {
  List<Currency> currency = [];
  currency.add(Currency("Afghanistan", t13_ic_afghanistan, "AFN"));
  currency.add(Currency("India", t13_ic_india, "Inr"));
  currency.add(Currency("United State", t13_ic_usa, "dollar"));
  currency.add(Currency("germany", t13_ic_germany, "Euro"));
  currency.add(Currency("indonesia", t13_ic_indonesia, "rupiah"));
  currency.add(Currency("turkey", t13_ic_turkey, "TRY"));
  currency.add(Currency("Portugal", t13_ic_portugal, "Euro"));
  return currency;
}

List<Photos> generatePhotos() {
  List<Photos> photos = [];
  photos.add(Photos(t13_ic_item1));
  photos.add(Photos(t13_ic_item2));
  photos.add(Photos(t13_ic_item3));
  photos.add(Photos(t13_ic_item4));
  return photos;
}

List<Filter> generateFilter() {
  List<Filter> filter = [];
  filter.add(Filter("Toronto", "(50 property)"));
  filter.add(Filter("Bali", "(50 property)"));
  filter.add(Filter("Santorini", "(50 property)"));
  filter.add(Filter("London", "(50 property)"));
  return filter;
}
