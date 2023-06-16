// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:material/api/api.dart';
import 'package:material/helpers/loading.dart';
import 'package:material/model/Material.dart';
import 'package:material/model/product.dart';
import 'package:material/values/url.dart';

class MaterialApi {
  static getMaterial() async {
    LoadingHelper.show();
    var url = BASE_URL + 'all/category';
    var response = await Api.execute(url: url);
    print(response);

    List<MaterialModel> materials = <MaterialModel>[];
    for (var material in response['category']) {
      materials.add(MaterialModel(material));
    }
    LoadingHelper.dismiss();
    return materials;
  }

  static getProduct(id) async {
    LoadingHelper.show();
    var url = BASE_URL + 'get/product';
    var data = {'id': id};
    var response = await Api.execute(url: url, data: data);
    print(response['product']);
    List<Product> products = <Product>[];
    for (var product in response['product']) {
      products.add(Product(product));
    }
    LoadingHelper.dismiss();
    return products;
  }
}
