import 'dart:async';

import 'package:chopper/chopper.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  final Map<Type, JsonFactory> factories;

  const JsonSerializableConverter(this.factories);

  T? _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      return null;
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => _decode<T>(v)).toList();

  dynamic _decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity as List);

    if (entity is Map) return _decodeMap<T>(entity as Map<String, dynamic>);

    return entity;
  }

  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
    Response response,
  ) async {
    final jsonRes = await super.convertResponse(response);

    return jsonRes.copyWith<ResultType>(
        body: _decode<Item>(jsonRes.body["products"]));
  }
}
