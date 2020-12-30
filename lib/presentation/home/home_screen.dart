import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:petgram/domain/api_service.dart';
import 'package:petgram/domain/model/network/breed_random.dart';
import 'package:petgram/domain/model/network/breed_list_response.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as json;

class HomeScreen extends StatelessWidget {
  FutureBuilder<Response<BreedListResponse>> _buildBody(BuildContext context) {
    return FutureBuilder<Response<BreedListResponse>>(
      future: Provider.of<ApiService>(context).getAllBreads(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final response = snapshot.data.body;
          return BreedListWidget(response.message.list.getRange(1,6).toList());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildBody(context),
    );
  }
}

class BreedListWidget extends StatelessWidget {
  final List<BreedModel> list;

  const BreedListWidget(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder<Response<BreedRandomResponse>>(
          future: Provider.of<ApiService>(context).getRandomByBreed(list[index].name),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final response = snapshot.data.body;
              return Image.network(response.message);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}

