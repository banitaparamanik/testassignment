import 'package:flutter/material.dart';
import 'package:testassignment/grid_image/model/grid_image_data_model.dart';
import 'package:testassignment/grid_image/views/image_card.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({ Key? key,
    required this.imageList,
  }) : super(key: key);
 final List<GridImageDataModel> imageList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Image Grid View"), centerTitle: true, elevation: 0) ,
      body:imageList.isNotEmpty? GridView.builder(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
          childAspectRatio: 0.75
        ),
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return SelectCard(
            gridImageDataModel: imageList[index],
          );
          // Item rendering
        },
      ): const Center(
              child: Text("Data Not Found"),
            ),
    );
  }
}


