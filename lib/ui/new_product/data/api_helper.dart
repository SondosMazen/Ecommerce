import 'package:dio/dio.dart';
import 'package:ecommerce_fav_cart_app/ui/new_product/models/add_product_model.dart';

class NewProductApiHelper {
  NewProductApiHelper._();
  static NewProductApiHelper apiHelper = NewProductApiHelper._();
  addNewProduct(AddNewProductRequest request) async {
    String url = 'https://fakestoreapi.com/products';
    Response response = await Dio().post(url, data: request.toMap());
    print(response.data);
  }

  updateProduct(AddNewProductRequest request, int productId) async {}
  deleteProduct(int productId) async {}
}
