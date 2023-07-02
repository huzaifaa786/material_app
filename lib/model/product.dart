class Product {
  int? id;
  int? vendor_id;
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
    image2 = product['image2'] ?? '';
    image3 = product['image3'] ?? '';
    description = product['description'];
    vendor_id = product['vendor_id'];
  }
}
