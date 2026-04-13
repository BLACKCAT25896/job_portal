import 'package:get/get.dart';

class SidebarController extends GetxController {
  String? expandedTopLevel;
  String? expandedNested;
  String? activeKey;

  void onTopLevelTap(String key, {bool hasChildren = false}) {
    if (hasChildren) {
      expandedTopLevel = expandedTopLevel == key ? null : key;
      expandedNested = null;
      activeKey = null;
    } else {
      expandedTopLevel = null;
      expandedNested = null;
      activeKey = key;
    }
    update();
  }

  void onNestedTap(String key, {bool hasChildren = false}) {
    if (hasChildren) {
      expandedNested = expandedNested == key ? null : key;
      activeKey = null;
    } else {
      activeKey = key;
    }
    update();
  }

  bool isExpanded(String key) =>
      expandedTopLevel == key || expandedNested == key;

  bool isActive(String key) => activeKey == key;
}
