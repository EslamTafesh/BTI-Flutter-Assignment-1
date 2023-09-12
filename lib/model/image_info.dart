class ImageInfoModel {
  String? imageUrl;
  String? name;
  String? description;
  List<PlacePictures>? pictures;

  ImageInfoModel(Map map) {
    imageUrl = map["imageUrl"];
    name = map["name"];
    description = map["description"];
    pictures = (map["pictures"] as List)
        .map(
          (e) => PlacePictures(e),
        )
        .toList();
  }
}

class PlacePictures {
  int? id;
  String? imageUrl;

  PlacePictures(Map map) {
    id = map["id"];
    imageUrl = map["imageUrl"];
  }
}
