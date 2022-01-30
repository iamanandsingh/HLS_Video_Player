import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/VideoModel.dart';

class UserApi{

  static Future<List<VideoModel>>getUserLocally() async
  {
    // final assetBundle=DefaultAssetBundle.of(context);
    final data=await rootBundle.loadString('assets/dataset.json');
    final body= jsonDecode(data);
    return body.map<VideoModel>(VideoModel.fromJson).toList();
  }

}