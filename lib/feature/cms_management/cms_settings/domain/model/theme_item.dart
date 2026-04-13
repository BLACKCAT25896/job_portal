import 'package:ecommerce/util/images.dart';

class ThemeItem {
  int id;
  final String key;
  final String image;


  ThemeItem({
    required this.id,
    required this.key,
    required this.image,
  });
}


final List<ThemeItem> availableThemes = [
  ThemeItem(id: 1, key: "default", image: Images.themeOne),
  ThemeItem(id: 2, key: "modern", image: Images.themeOne),
  ThemeItem(id: 3, key: "grocery", image: Images.themeOne),
  ThemeItem(id: 4, key: "megaMart", image: Images.themeOne),
  ThemeItem(id: 5,key: "fashion", image: Images.themeOne),
  ThemeItem(id: 6, key: "sports", image: Images.themeOne),
  ThemeItem(id: 7, key: "electric", image: Images.themeOne),
  ThemeItem(id: 8, key: "medical", image: Images.themeOne),
  ThemeItem(id: 9, key: "furniture", image: Images.themeOne),
  ThemeItem(id: 10, key: "construction", image: Images.themeOne),
  ThemeItem(id: 11, key: "automobile", image: Images.themeOne),
];
