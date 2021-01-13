import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:petgram/domain/api_service.dart';
import 'package:petgram/domain/model/network/breed_random.dart';
import 'package:petgram/domain/model/network/breed_list_response.dart';
import 'package:petgram/presentation/detail/detail_screen.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as json;

class HomeScreen extends StatelessWidget {
  FutureBuilder<Response<BreedListResponse>> _buildBody(BuildContext context) {
    return FutureBuilder<Response<BreedListResponse>>(
      future: Provider.of<ApiService>(context).getAllBreads(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final response = snapshot.data.body;
          return BreedListWidget(response.message.list.getRange(1,10).toList());
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
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                    onTap: () => _navigateToDetail(context, list[index]),
                    child: Image.network(response.message, fit: BoxFit.cover)
                ),
              );
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

  void _navigateToDetail(BuildContext context, BreedModel breedModel) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailScreen(breedModel),
      ),
    );
  }
}

