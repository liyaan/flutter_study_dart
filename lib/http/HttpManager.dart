import 'package:dio/dio.dart';

import 'Api.dart';

class HttpManager{
  Dio? _dio;
  static HttpManager? _instance;

  factory HttpManager.getInstance(){
    if(null == _instance){
      _instance = new HttpManager._internal();
    }
    return _instance!;
  }
  HttpManager._internal(){
    BaseOptions options = new BaseOptions(
      baseUrl: Api.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = new Dio(options);
  }

  request(url,{String method = "get"}) async{
    try{
      Options options = new Options(method:method);
      Response response = await _dio!.request(url,options: options);
      print(response.data);
      return response.data;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}