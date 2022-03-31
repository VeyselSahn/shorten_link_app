import 'dart:convert';

import 'package:grisoft/core/constant/hive_constants.dart';
import 'package:grisoft/core/model/link_item_model.dart';
import 'package:hive_flutter/adapters.dart';

class CacheService {
  static final instance = CacheService();
  Future openBox() async {
    await Hive.openBox(HiveConstants.instance.linksBoxKey);
  }

  void addLink(LinkItemModel model) {
    var box = Hive.box(HiveConstants.instance.linksBoxKey);
    box.add(jsonEncode(model.toJson()));
  }

  List<LinkItemModel> getLinks() {
    var ticketBox = Hive.box(HiveConstants.instance.linksBoxKey);
    var allList = ticketBox.values.toList();
    var localOrderList = <LinkItemModel>[];
    for (var element in allList) {
      localOrderList.add(LinkItemModel.fromJson(jsonDecode(element)));
    }
    return localOrderList;
  }

  Future<void> deleteLink(LinkItemModel model) async {
    var box = Hive.box(HiveConstants.instance.linksBoxKey);
    var _currentlist = box.values.toList();
    _currentlist.remove(jsonEncode(model.toJson()));
    await box.clear();
    for (var item in _currentlist) {
      addLink(LinkItemModel.fromJson(jsonDecode(item)));
    }
  }

  Future<void> saveServerAddress(String serverAdress) async {
    var _box = await Hive.openBox('server');
    await _box.put('link', serverAdress);
    await _box.close();
  }

  Future<String> getServerAddress() async {
    var _box = await Hive.openBox('server');
    return _box.get('link');
  }
}
