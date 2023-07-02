class MCategory {
  int? id;
  String? name;
  String? image;

  MCategory(product) {
    id = product['id'];
    name = product['name'];
    image = product['image'];
  }
}
