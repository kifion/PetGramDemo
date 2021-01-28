import 'package:chopper/chopper.dart';
import 'package:petgram/domain/api_service.dart';
import 'package:petgram/domain/model/network/breed_list_response.dart';
import 'package:provider/provider.dart';

class HomeController {
  Future<Response<BreedListResponse>> getAllBreads() {
    //return Provider.of<ApiService>(context).getAllBreads();
  }
}