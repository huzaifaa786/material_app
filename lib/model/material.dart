// ignore_for_file: file_names

class MaterialModel {
  int? id;
  String? name;
  String? image;

  MaterialModel(material) {
    id = material['id'];
    name = material['name'];
    image = material['image'] ?? '';
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
