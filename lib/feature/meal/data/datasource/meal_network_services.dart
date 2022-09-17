import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'meal_network_services.g.dart';


@RestApi()
abstract class MealNetworkServices {
  factory MealNetworkServices(Dio dio , {String baseUrl}) = _MealNetworkServices;

  @GET('/json/v1/1/search.php')
  Future<HttpResponse> getMealList(
    @Query('s') String search
  );

  @GET('/json/v1/1/lookup.php')
  Future<HttpResponse> getMealSingle(
    @Query('i') String search
  );
}