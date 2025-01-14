
import 'package:get/get.dart';
import 'package:chandrima_real_estate/common/widgets/custom_snackbar.dart';
import 'package:chandrima_real_estate/features/home/model/category_model.dart';
import 'package:chandrima_real_estate/features/home/model/category_products_model.dart';
import 'package:chandrima_real_estate/features/home/model/product_details_model.dart';
import 'package:chandrima_real_estate/features/home/model/product_model.dart';
import 'package:chandrima_real_estate/features/home/model/slider_model.dart';

import 'package:chandrima_real_estate/features/home/repository/home_repository.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});


  SlidersModel ? _slidersModel;
  List<CategoryModel> ?_categoryList=[];
  List<ProductModel> ?_productList=[];
  bool _isLoading = false;
  CategoryProductsModel? _categoryProductsModel;
  ProductDetailsModel ?_productDetailsModel;




  bool get isLoading => _isLoading;
  SlidersModel ? get slidersModel => _slidersModel;
  List<CategoryModel>? get categoryList  => _categoryList;
  List<ProductModel>? get allProductList  => _productList;
  CategoryProductsModel? get categoryProductsModel => _categoryProductsModel;
  ProductDetailsModel? get productDetailsModel => _productDetailsModel;



getCategoryWiseProducts(String id)async{
  _isLoading=true;
   _categoryProductsModel?.products?.clear();
  update();
  Response response=await homeRepository.getCategoryWiseProducts(id);
  if(response.statusCode==200){
    _categoryProductsModel=CategoryProductsModel.fromJson(response.body);
    print("Category Products are: ${_categoryProductsModel?.products?.length}");
    _isLoading=false;
    update();
  }else{
    _isLoading=false;
    update();
    showCustomSnackBar("No Products Found");
  }
}
  getProductDetails(String slug)async{
  _isLoading=true;
  _productDetailsModel=null;
  update();
  Response response=await homeRepository.getProductDetails(slug);
  if(response.statusCode==200){
    _productDetailsModel=ProductDetailsModel.fromJson(response.body);
    print(" Products details are: ${_productDetailsModel?.product?.name}");
    _isLoading=false;
    update();
  }else{
    _isLoading=false;
    update();
    showCustomSnackBar("No Data Found");
  }
}



  Future<void> getSlidersData()async{
    _isLoading=true;
    update();
    Response response=await homeRepository.getSlidersData();
    if(response.statusCode==200){
      _slidersModel=SlidersModel.fromJson(response.body);
      print("newsListttttttttttttttttttttttttttttttttttttttttt: ${_slidersModel?.sliders?.length}");
      _isLoading=false;
      update();
    }else{
      _isLoading=false;
      update();
      showCustomSnackBar("Something went wrong");
    }
  }


  Future<void> getCategoryData()async{
    _isLoading=true;
    update();
    Response response=await homeRepository.getCategoryData();
    if(response.statusCode==200){
       _categoryList?.addAll((response.body as List).map((item) => CategoryModel.fromJson(item)).toList());
      print("Categoryyyyyyyyyyyyyyyyyyyyyy list is : ${_productList?.length}");
      _isLoading=false;
      update();
    }else{
      _isLoading=false;
      update();
      showCustomSnackBar("Something went wrong");
    }
  }

  Future<void> getAllProductData()async{
    _isLoading=true;
    update();
    Response response=await homeRepository.getAllProductsData();
    if(response.statusCode==200){
      _productList?.addAll((response.body as List).map((item) => ProductModel.fromJson(item)).toList());

      _isLoading=false;
      update();
    }else{
      _isLoading=false;
      update();
      showCustomSnackBar("Something went wrong");
    }
  }


}