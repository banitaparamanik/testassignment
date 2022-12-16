class ImageList {
  ImageList({required this.imageList});
  final List<GridImageDataModel> imageList;

  factory ImageList.fromJson(Map<String, dynamic> json) {
    return ImageList(
        imageList: json['imageList'] != null
            ? (json['imageList'] as List<dynamic>)
                .map((dynamic v) =>
                    GridImageDataModel.fromJson(v as Map<String, dynamic>))
                .toList()
            : []);
  }
}

class GridImageDataModel {
  GridImageDataModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory GridImageDataModel.fromJson(Map<String, dynamic> json) {
    return GridImageDataModel(
      id: json['id'],
      albumId: json['albumId'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
