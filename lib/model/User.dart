// ignore_for_file: file_names

class User {
  int? id;
  String? name;
  String? email;
  String? apiToken;
  String? phone;
  String? image;
  String? location;


  User(user) {
    id = user['id'];
    name = user['name'];
    email = user['email'];
    apiToken = user['api_token'] ?? '';
    phone = user['phone'];
    image = user['profilepic'] ?? '';
  }
}
