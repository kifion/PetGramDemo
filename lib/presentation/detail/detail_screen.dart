import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petgram/data/network/api_service.dart';
import 'package:petgram/data/network/model/breed_images.dart';
import 'package:petgram/data/network/model/breed_list_response.dart';
import 'package:petgram/extensions.dart';
import 'package:petgram/presentation/preview/preview_screen.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final BreedModel breedModel;

  DetailScreen(this.breedModel);

  void _navigateToPreview(BuildContext context, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PreviewScreen(url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breedModel.name.capitalize()),
      ),
      body: Container(
        child: FutureBuilder<Response<BreedImagesResponse>>(
          future: Provider.of<ApiService>(context)
              .getImageListByBreed(breedModel.name),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var urlList = snapshot.data.body.message;
              return GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: urlList.map((String url) {
                    return InkWell(
                        onTap: () => _navigateToPreview(context, url),
                        child: GridTile(child: Image.network(url, fit: BoxFit.cover)),
                    );
                  }).toList());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
