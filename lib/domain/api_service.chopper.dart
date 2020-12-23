// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ApiService extends ApiService {
  _$ApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ApiService;

  Future<Response<BreadListResponse>> getAllBreads() {
    final $url = '/api/breeds/list/all';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BreadListResponse, BreadListResponse>($request);
  }
}
