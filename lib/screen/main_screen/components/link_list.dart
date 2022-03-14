import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grisoft/core/init/extensions/image_path_extensions.dart';

import '../../../core/constant/colors.dart';

class ListYedek extends StatelessWidget {
  const ListYedek({Key? key}) : super(key: key);

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
            itemCount: 3,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return listItem(size);
            },
          ),
        )
      ],
    );
  }

  Widget listItem(Size size) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      actionsPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('http://grisoftbilisim.com', style: TextStyle(color: Colors.black, fontSize: 15)),
              SvgPicture.asset('del'.svgImageAsset)
            ],
          ),
          const Divider(
            color: Colors.black,
          )
        ],
      ),
      content: const Text('http://sashasjha', style: TextStyle(color: ColorConstants.cyan, fontSize: 14)),
      actions: [
        Container(
          width: size.width - 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ColorConstants.cyan,
          ),
          child: const Center(
            child: Text('COPY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          height: 40,
        )
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
