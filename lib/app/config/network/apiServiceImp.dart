import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hrplatform/app/config/network/apiEndpoint.dart';
import 'package:hrplatform/app/config/network/apiServiceRepo.dart';
import 'package:hrplatform/app/config/services/main_services.dart';
import 'package:hrplatform/app/config/widgets/waiting_process.dart';
import 'package:image_picker/image_picker.dart';

class APIServiceImp extends APIServiceRepo {
  late Dio _dio;

  APIServiceImp() {
    _dio = Dio(BaseOptions(
      baseUrl: APIEndpoint.baseUrl.toString().trim(),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      validateStatus: (status) {
        return status != null && status < 500; // Accept all 4xx status codes
      },
    ));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioError e, handler) async {
          if (e.response?.statusCode == 401) {
            String? newAccessToken = await refreshToken();
            if (newAccessToken != null) {
              final options = e.requestOptions;
              options.headers['Authorization'] = 'Bearer $newAccessToken';
              return handler.resolve(await _dio.fetch(options));
            }
          } else if (e.response?.statusCode == 502 ||
              e.response?.statusCode == 503) {
            MainServices.errorHandler();
          } else {
            return handler.next(e);
          }
        },
      ),
    );
  }

  Future<String?> refreshToken() async {
   return 'refreshToken';
  }

  @override
  Future<Response> getRequest(String pathAPI,
      {Map<String, dynamic>? query,
      bool? useToken = true,
      bool? isRefreshToken = false,
      bool showLoad = true}) async {
    log("pathAPI : $pathAPI");
    showLoad == true ? Waiting.show() : null;
    try {
      final response = await _dio.get(
        queryParameters: query,
        pathAPI,
        data: query,
        options: Options(
          headers: buildHeaders(
              useToken: useToken ?? true, isRefreshToken: isRefreshToken!),
        ),
      );

      //  log("response : ${response.data}");
      return Result.resulData(
          response: response, showLoad: showLoad, apiPath: pathAPI.toString());
    } on DioError catch (e) {
      log('Error in GET request: $e');
      return _handleDioError(e);
    }
  }

  @override
  Future<Response> postRequest(
    String pathAPI, {
    Map<String, dynamic>? query,
    bool? useToken = true,
    bool? isRefreshToken = false,
    bool showLoad = true,
  }) async {
    showLoad == true ? Waiting.show() : null;
    try {
      final response = await _dio.post(
        pathAPI,
        data: query,
        options: Options(
          headers: buildHeaders(useToken: useToken ?? true),
        ),
      );
      log("pathAPI : $pathAPI");
      // log("send : $pathAPI ==> statusCode : ${response.statusCode}");
      return Result.resulData(response: response, showLoad: showLoad);
    } on DioError catch (e) {
      log('Error in POST request: $e');
      return _handleDioError(e);
    }
  }

  @override
  Future<Response> putRequest(String pathAPI,
      {Map<String, dynamic>? query,
      bool? useToken = true,
      bool? isRefreshToken = false,
      bool showLoad = true}) async {
    log("pathAPI : $pathAPI");
    showLoad == true ? Waiting.show() : null;
    try {
      final response = await _dio.put(
        pathAPI,
        data: query,
        options: Options(
          headers: buildHeaders(useToken: useToken ?? true),
        ),
      );
      return Result.resulData(response: response, showLoad: showLoad);
    } on DioError catch (e) {
      log('Error in PUT request: $e');
      return _handleDioError(e);
    }
  }

  @override
  Future<Response> deleteRequest(
    String pathAPI, {
    Object? query,
    bool? useToken = true,
    bool? isRefreshToken = false,
    bool showLoad = true,
  }) async {
    showLoad == true ? Waiting.show() : null;
    try {
      final response = await _dio.delete(
        pathAPI,
        data: query,
        options: Options(
          headers: buildHeaders(useToken: useToken ?? true),
        ),
      );
      return Result.resulData(response: response, showLoad: showLoad);
    } on DioError catch (e) {
      log('Error in DELETE request: $e');
      return _handleDioError(e);
    }
  }

  Response _handleDioError(DioError e) {
    if (e.response != null) {
      return e.response!;
    } else {
      return Response(
        requestOptions: e.requestOptions,
        statusCode: 500,
        statusMessage: e.message,
        data: 'Internal Server Error',
      );
    }
  }

  @override
  Future<Response> postRequestWithFile(String pathAPI,
      {Map<String, dynamic>? query,
      bool? useToken = true,
      bool? isRefreshToken = false,
      bool showLoad = true}) async {
    showLoad == true ? Waiting.show() : null;
    try {
      FormData formData = FormData();
      query?.forEach((key, value) async {
        if (value is XFile) {
          formData.files.add(
            MapEntry(
              key,
              await MultipartFile.fromFile(
                value.path,
                filename: value.name,
              ),
            ),
          );
        } else {
          formData.fields.add(MapEntry(key, value.toString()));
        }
      });

      final response = await _dio.put(
        pathAPI,
        data: formData,
        options: Options(
          headers: buildHeaders(useToken: useToken ?? true),
        ),
      );
      log("pathAPI : $pathAPI");
      // log("send : $pathAPI ==> statusCode : ${response.statusCode}");
      return Result.resulData(response: response, showLoad: showLoad);
    } on DioError catch (e) {
      log('Error in POST request: $e');
      return _handleDioError(e);
    }
  }
}

class Result {
  static Response resulData(
      {required Response response, bool showLoad = true, String? apiPath}) {
    if (response.statusCode == null || response.statusCode == 404) {
      return Response(
        requestOptions: response.requestOptions,
        data: 'Bad Response Format!',
        statusCode: response.statusCode,
      );
    }
    if (response.statusCode == 200) {
      // handle success
    }
    if (response.statusCode == 403) {
      // handle unauthorized
    }
    if (response.statusCode == 422) {
      // handle unprocessable entity
    }
    if (response.statusCode == 400) {
      // handle bad request
    }
    if (response.statusCode == 500) {
      // handle server error
    }
    return response;
  }
}

Map<String, String> buildHeaders(
    {bool useToken = true, bool isRefreshToken = false}) {
  final headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json; charset=UTF-8',
  };
  if (useToken) {
    String? token = isRefreshToken == false
        ? 'get access token'
        : 'get refresh token';
    if (token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
  }
  return headers;
}
