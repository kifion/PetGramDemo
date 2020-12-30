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

  Future<Response<BreedListResponse>> getAllBreads() {
    final $url = '/api/breeds/list/all';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BreedListResponse, BreedListResponse>($request);
  }

  Future<Response<BreedRandomResponse>> getRandomByBreed(String breed) {
    final $url = '/api/breed/${breed}/images/random';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BreedRandomResponse, BreedRandomResponse>($request);
  }
}
