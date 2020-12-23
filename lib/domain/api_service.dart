import 'package:chopper/chopper.dart';

import 'converter/json_to_type_converter.dart';
import 'model/network/bread_list_response.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/api')
abstract class ApiService extends ChopperService {
  @Get(path: '/breeds/list/all')
  Future<Response<BreadListResponse>> getAllBreads();

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://dog.ceo',
      services: [_$ApiService()],
      converter: JsonToTypeConverter({
        BreadListResponse: (jsonData) => BreadListResponse.fromJson(jsonData)
      }),
    );
    return _$ApiService(client);
  }
}
