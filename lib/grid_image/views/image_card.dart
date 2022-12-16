import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:testassignment/grid_image/model/grid_image_data_model.dart';

class SelectCard extends StatelessWidget {
  final GridImageDataModel gridImageDataModel;
  const SelectCard({Key? key, required this.gridImageDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: gridImageDataModel.thumbnailUrl,
          fit: BoxFit.contain,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => SizedBox(
              height: 150,
              width: 150,
              child: Image.asset("assets/images/image-preview.jpg")),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(gridImageDataModel.title, textAlign: TextAlign.left,
          // overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
