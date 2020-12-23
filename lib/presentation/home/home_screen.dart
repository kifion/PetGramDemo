import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:petgram/domain/api_service.dart';
import 'package:petgram/domain/model/network/bread_list_response.dart';
import 'package:petgram/localization/app_localization.dart';
import 'package:petgram/presentation/home/widget_settings_button.dart';
import 'package:provider/provider.dart';

import '../detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('title')),
        actions: [SettingsButtonWidget()],
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<Response<BreadListResponse>> _buildBody(BuildContext context) {
    return FutureBuilder<Response<BreadListResponse>>(
      future: Provider.of<ApiService>(context).getAllBreads(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final response = snapshot.data.body;
          return Text(response.message.toString());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailScreen(),
      ),
    );
  }
}
