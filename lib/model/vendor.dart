// ignore_for_file: file_names

class VendorModel {
  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;

  VendorModel(vendor) {
    id = vendor['id'];
    name = vendor['name'];
    email = vendor['email'] ?? '';
    address = vendor['address'] ?? '';
    phone = vendor['phone'] ?? '';
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'address': address,
        'phone': phone
      };
}
