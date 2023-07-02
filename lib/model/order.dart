class Order {
  int? id;
  String? name;
  String? phone;

  Order(product) {
    id = product['id'];
    name = product['vendor']['name'];
    phone = product['vendor']['phone'];
  }
}
