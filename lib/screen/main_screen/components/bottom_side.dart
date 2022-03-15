import 'package:flutter/material.dart';
import 'package:grisoft/core/constant/texts.dart';
import 'package:grisoft/core/init/extensions/validation_extensions.dart';
import 'package:grisoft/core/init/styles/text_styles.dart';
import 'package:grisoft/core/model/link_item_model.dart';
import 'package:grisoft/core/provider/links_provider.dart';
import 'package:grisoft/core/service/cache_service.dart';
import 'package:grisoft/core/service/shorten_service.dart';
import 'package:grisoft/core/widgets/snackbar.dart';

import '../../../core/constant/colors.dart';

class BottomSide extends StatelessWidget {
  final LinksProvider linksProvider;
  const BottomSide({Key? key, required this.linksProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * .08,
            child: TextFormField(
              controller: linksProvider.linkController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hoverColor: Colors.white,
                  filled: true,
                  fillColor: ColorConstants.background,
                  hintText: linksProvider.isWarn ? Texts.instance.fieldEmotyWarn : Texts.instance.textfieldEmpty,
                  hintStyle: TextStyle(color: linksProvider.isWarn ? Colors.red : Colors.grey.shade600, fontSize: 16),
                  border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent))),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () async {
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
            },
            child: Container(
              width: size.width * 0.8,
              height: size.height * .08,
              child: Center(
                  child: Text(
                Texts.instance.shortenButton,
                style: TextStyles.instance.shortenButton,
              )),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: ColorConstants.cyan),
            ),
          )
        ],
      ),
    );
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
}
