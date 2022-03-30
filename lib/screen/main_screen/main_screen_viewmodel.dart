import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grisoft/core/constant/colors.dart';
import 'package:grisoft/core/init/extensions/device_size_extensions.dart';
import 'package:grisoft/core/init/extensions/validation_extensions.dart';
import 'package:grisoft/core/provider/links_provider.dart';
import 'package:provider/provider.dart';

import '../../core/constant/texts.dart';
import '../../core/model/link_item_model.dart';
import '../../core/service/cache_service.dart';
import '../../core/service/shorten_service.dart';
import '../../core/widgets/snackbar.dart';

abstract class MainScreenViewModel {
  Future<void> shorten(BuildContext context) async {
    var linksProvider = context.read<LinksProvider>();
    if (linksProvider.linkController.text.isEmpty) {
      linksProvider.changeIsWarn(true);
    } else if (!linksProvider.linkController.text.isValid) {
      showSnacbar(context, Texts.instance.validLink);
    } else {
      buildShowDialog(context);
      linksProvider.changeIsWarn(false);
      var respose = await ShortenService().shortenLink(linksProvider.linkController.text);
      if (respose != null) {
        var model = LinkItemModel.fromJson(respose['result'] ?? {});
        CacheService.instance.addLink(model);
        linksProvider.linkController.clear();
      } else {
        showSnacbar(context, Texts.instance.wentWrong);
      }
      Navigator.pop(context);
    }
  }

  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void deleteLink(LinkItemModel model) async {
    await CacheService.instance.deleteLink(model);
  }

  void copyLink(LinkItemModel model, LinksProvider linksProvider) async {
    await Clipboard.setData(ClipboardData(text: model.shortLink!));
    linksProvider.changeCopiedLink(model.shortLink ?? '');
  }

  Future<void> serverAddressDialog(BuildContext context) async {
    var _controller = TextEditingController();
    await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: ColorConstants.background,
            title: const Text('Add Server Address'),
            content: SizedBox(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'http://'),
              ),
            ),
            actions: [
              ElevatedButton.icon(
                  onPressed: () {
                    CacheService.instance.saveServerAddress(_controller.text);
                    Navigator.pop(context, 'server address dialog');
                  },
                  icon: const Icon(Icons.save),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorConstants.purple)),
                  label: const Text('Save'))
            ],
          );
        });
  }
}
