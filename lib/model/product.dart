class Product {
  int? id;
  String? name;
  String? price;
  String? unit;
  String? vendorName;
  String? image1;
  String? image2;
  String? image3;
  String? description;
  String? phone;

  Product(product) {
    id = product['id'];
    name = product['name'];
    price = product['price'];
    unit = product['unit'];
    image1 = product['image1'] ?? '';
    image2 = product['image1'] ?? '';
    image3 = product['image1'] ?? '';
    description = product['description'];
    vendorName = product['vendor']['name'];
    phone = product['vendor']['phone'];
  }
}
