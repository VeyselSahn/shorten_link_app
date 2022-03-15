import 'package:flutter/cupertino.dart';
import 'package:grisoft/core/model/link_item_model.dart';

class LinksProvider extends ChangeNotifier {
  List<LinkItemModel> linkList = [];
  TextEditingController linkController = TextEditingController();
  bool isLoading = false;

  void changeLoading() {
    isLoading = !isLoading;
    print(isLoading.toString());
    notifyListeners();
  }

  void addLink(LinkItemModel newModel) {
    linkList.add(newModel);
    notifyListeners();
  }

  void deleteLink(LinkItemModel model) {
    linkList.remove(model);
    notifyListeners();
  }

  //
  bool isWarn = false;
  void changeIsWarn(bool newStatus) {
    isWarn = newStatus;
    notifyListeners();
  }
}
