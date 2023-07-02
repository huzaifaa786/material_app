class CartItem {
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

  CartItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.vendor_id,
      required this.phone});
}
