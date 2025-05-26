import 'package:coffee_shop/controllers/popular_product_controller.dart';
import 'package:coffee_shop/data/api/api_client.dart';
import 'package:coffee_shop/data/reposity/popular_product_repo.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://api.example.com"));
  
  //reposity
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
