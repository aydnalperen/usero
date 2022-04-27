import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:usero/models/post_model.dart';

abstract class INetworkManager{
  Future<PostModel?> fetchUserInfo();
}
class NetworkManager implements INetworkManager{
  final Dio _dio;
  NetworkManager():_dio = Dio(BaseOptions(baseUrl: "https://randomuser.me/api/"));

  @override
  Future < PostModel?> fetchUserInfo() async{
    try{
      final response = await _dio.get('https://randomuser.me/api/');
      if(response.statusCode == HttpStatus.ok){
        final _data  = response.data;
        return PostModel.fromJson(_data);
      }
      
    } on DioError catch(e){
        _ShowDebug.showDioError(e,this);
    }
    return null;
  }
  

}
class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}