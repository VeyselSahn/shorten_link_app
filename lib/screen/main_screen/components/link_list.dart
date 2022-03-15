import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grisoft/core/init/extensions/image_path_extensions.dart';
import 'package:grisoft/core/model/link_item_model.dart';
import 'package:grisoft/core/provider/links_provider.dart';

import '../../../core/constant/colors.dart';

class ListYedek extends StatelessWidget {
  final LinksProvider linksProvider;
  const ListYedek({Key? key, required this.linksProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        const Text(
          'Your Link History',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        SizedBox(
          height: size.height * 3 / 4 - 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: linksProvider.linkList.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return listItem(size, linksProvider.linkList.elementAt(index));
            },
          ),
        )
      ],
    );
  }

  Widget listItem(Size size, LinkItemModel model) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      actionsPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.realLink ?? '', style: const TextStyle(color: Colors.black, fontSize: 15)),
              GestureDetector(
                  onTap: () => linksProvider.deleteLink(model), child: SvgPicture.asset('del'.svgImageAsset))
            ],
          ),
          const Divider(
            color: Colors.black,
          )
        ],
      ),
      content: Text(model.shortLink ?? '', style: const TextStyle(color: ColorConstants.cyan, fontSize: 14)),
      actions: [
        GestureDetector(
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: model.shortLink!));
            await Clipboard.getData('text/plain').then((value) => print(value?.text.toString()));
          },
          child: Container(
            width: size.width - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ColorConstants.cyan,
            ),
            child: const Center(
              child: Text("Copy", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            height: 40,
          ),
        )
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
