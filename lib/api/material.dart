// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter/foundation.dart';
import 'package:material/api/api.dart';
import 'package:material/helpers/loading.dart';
import 'package:material/model/category.dart';
import 'package:material/model/product.dart';
import 'package:material/model/vendor.dart';
import 'package:material/values/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MaterialApi {
  static getMaterial() async {
    LoadingHelper.show();
    var url = BASE_URL + 'vendor/all';
    final pref = await SharedPreferences.getInstance();
    var api_token = pref.getString('api_token');
    print(api_token);
    var data = {'api_token': api_token};
    var response = await Api.execute(url: url, data: data);
    print(response);

    List<VendorModel> materials = <VendorModel>[];
    for (var material in response['vendors']) {
      materials.add(VendorModel(material));
    }
    LoadingHelper.dismiss();
    return materials;
  }
  
    static getCategory() async {
    LoadingHelper.show();
    var url = BASE_URL + 'all/category';
    final pref = await SharedPreferences.getInstance();
    var api_token = pref.getString('api_token');
    print(api_token);
    var data = {'api_token': api_token};
    var response = await Api.execute(url: url, data: data);
    print(response);

    List<MCategory> categories = <MCategory>[];
    for (var category in response['category']) {
      categories.add(MCategory(category));
    }
    LoadingHelper.dismiss();
    return categories;
  }

  static getProduct(id) async {
    LoadingHelper.show();
    var url = BASE_URL + 'vendor/products';
    final pref = await SharedPreferences.getInstance();
    var api_token = pref.getString('api_token');
    var data = {'vendor_id': id, 'api_token': api_token};
    var response = await Api.execute(url: url, data: data);
    print(response['products']);
    List<Product> products = <Product>[];
    for (var product in response['products']) {
      products.add(Product(product));
    }
    LoadingHelper.dismiss();
    return products;
  }
}
