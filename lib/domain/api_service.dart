import 'package:chopper/chopper.dart';

import 'converter/json_to_type_converter.dart';
import 'model/network/breed_images.dart';
import 'model/network/breed_list_response.dart';
import 'model/network/breed_random.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/api')
abstract class ApiService extends ChopperService {
  @Get(path: '/breeds/list/all')
  Future<Response<BreedListResponse>> getAllBreads();

  @Get(path: '/breed/{breed}/images/random')
  Future<Response<BreedRandomResponse>> getRandomByBreed(
      @Path('breed') String breed);

  @Get(path: '/breed/{breed}/images')
  Future<Response<BreedImagesResponse>> getImageListByBreed(
      @Path('breed') String breed);

  static ApiService create() {
    final client = ChopperClient(
        baseUrl: 'https://dog.ceo',
        services: [_$ApiService()],
        converter: JsonToTypeConverter({
          BreedListResponse: (jsonData) => BreedListResponse.fromJson(jsonData),
          BreedRandomResponse: (jsonData) => BreedRandomResponse.fromJson(jsonData),
          BreedImagesResponse: (jsonData) => BreedImagesResponse.fromJson(jsonData),
        }),
        interceptors: [
          HeadersInterceptor({'Cache-Control': 'no-cache'}),
          HttpLoggingInterceptor(),
        ]);
    return _$ApiService(client);
  }
}
