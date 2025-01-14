import 'package:get/get.dart';
import 'package:chandrima_real_estate/data/api/api_client.dart';
import 'package:chandrima_real_estate/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  final ApiClient apiClient;

  HomeRepository({required this.apiClient} );


  Future<Response> getSlidersData()async{
    return await apiClient.getData("get-home-slider-data");
  }


  Future<Response> getCategoryWiseProducts(String id)async{
    return await apiClient.getData("${AppConstants.categoryWiseProductListUri}$id");
  }


  Future<Response> getCategoryData()async{
    return await apiClient.getData("get-categories");
  }

  Future<Response> getAllProductsData()async{
    return await apiClient.getData(AppConstants.allProductListUri);
  }

  Future<Response> getProductDetails(String slug)async{
    return await apiClient.getData("${AppConstants.productDetailsUri}${slug}");
  }

}