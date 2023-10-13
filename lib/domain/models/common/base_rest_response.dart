class BaseResponse<T> {
  final bool success;
  final T data;

  BaseResponse(this.data, this.success);

  Map<String, dynamic> toJson() {
    return {
      "data": data,
    };
  }

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) build) {
    return BaseResponse(build(json['data']), json['success']);
  }

  factory BaseResponse.fromJsonSingle(Map<String, dynamic> json) {
    return BaseResponse(json['data'] as T, json['success'] as bool);
  }

  factory BaseResponse.fromJsonStringData(Map<String, dynamic> json) {
    return BaseResponse(json['data'] as T, json['sucess'] as bool);
  }
}

class BaseListResponse {
  List<dynamic> data;

  BaseListResponse(this.data);

  factory BaseListResponse.fromJson(Map<String, dynamic> json) {
    return BaseListResponse((json['data'] as List<dynamic>));
  }

  factory BaseListResponse.fromJsonStringData(Map<String, dynamic> json) {
    return BaseListResponse(json['data'] as dynamic);
  }
}
