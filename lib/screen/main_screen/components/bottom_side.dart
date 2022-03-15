import 'package:flutter/material.dart';
import 'package:grisoft/core/constant/texts.dart';
import 'package:grisoft/core/model/link_item_model.dart';
import 'package:grisoft/core/provider/links_provider.dart';
import 'package:grisoft/core/service/shorten_service.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/colors.dart';

class BottomSide extends StatelessWidget {
  final LinksProvider linksProvider;
  const BottomSide({Key? key, required this.linksProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            child: SizedBox(
              height: 55,
              child: TextFormField(
                controller: linksProvider.linkController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hoverColor: Colors.white,
                    filled: true,
                    fillColor: ColorConstants.background,
                    hintText: linksProvider.isWarn ? Texts.instance.fieldEmotyWarn : Texts.instance.textfieldEmpty,
                    hintStyle: TextStyle(color: linksProvider.isWarn ? Colors.red : Colors.black),
                    border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent))),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              if (linksProvider.linkController.text.isEmpty) {
                linksProvider.changeIsWarn(true);
              } else {
                linksProvider.changeLoading();
                linksProvider.changeIsWarn(false);

                var respose = await ShortenService().shortenLink(linksProvider.linkController.text);
                var model = LinkItemModel(
                    realLink: respose['result']['original_link'], shortLink: respose['result']['short_link']);
                linksProvider.addLink(model);
                linksProvider.linkController.clear();
                linksProvider.changeLoading();
              }
            },
            child: Container(
              width: size.width - 100,
              height: 55,
              child: Center(
                  child: Text(
                Texts.instance.shortenButton,
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: ColorConstants.cyan),
            ),
          )
        ],
      ),
    );
  }
}
