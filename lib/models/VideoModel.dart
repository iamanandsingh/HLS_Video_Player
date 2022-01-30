import 'dart:convert';

import 'package:flutter/material.dart';

// VideoModel videoModelFromJson(String str) => VideoModel.fromJson(json.decode(str));

// String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {

   int id;
    String title;
    String videoUrl;
    String coverPicture;

    VideoModel({
       required this.id,
      required  this.title,
      required  this.videoUrl,
     required   this.coverPicture,
    });


    static VideoModel fromJson(json) => VideoModel(
        id: json["id"],
        title: json["title"],
        videoUrl: json["videoUrl"],
        coverPicture: json["coverPicture"],
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "title": title,
    //     "videoUrl": videoUrl,
    //     "coverPicture": coverPicture,
    // };
}
