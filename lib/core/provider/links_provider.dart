import 'package:flutter/cupertino.dart';

class LinksProvider extends ChangeNotifier {
  TextEditingController linkController = TextEditingController();
  String copiedLink = '';

  void changeCopiedLink(String link) {
    copiedLink = link;
    notifyListeners();
  }

  //
  bool isWarn = false;
  void changeIsWarn(bool newStatus) {
    isWarn = newStatus;
    notifyListeners();
  }
}
