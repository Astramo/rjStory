// To parse this JSON data, do
//
//     final storyModel = storyModelFromJson(jsonString);

import 'dart:convert';


import 'package:json_annotation/json_annotation.dart';


part 'StoryModel.g.dart';

@JsonSerializable()
class StoryModel {
    StoryModel({
        this.id,
        this.hashId,
        this.title,
        this.mp3,
        this.artist,
        this.song,
        this.hqLink,
        this.link,
        this.filename,
        this.shareLink,
        this.photo,
        this.thumbnail,
        this.verified,
        this.type,
        this.likes,
        this.likesPretty,
        this.hls,
        this.hdvc,
        this.user,
        this.location,
    });

    int? id;
    String? hashId;
    String? title;
    int? mp3;
    String? artist;
    String? song;
    String? hqLink;
    String? link;
    String? filename;
    String? shareLink;
    String? photo;
    String? thumbnail;
    bool? verified;
    String? type;
    String? likes;
    String? likesPretty;
    String? hls;
    String? hdvc;
    User? user;
    String? location;

    factory StoryModel.fromRawJson(String str) => StoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        id: json["id"] == null ? null : json["id"],
        hashId: json["hash_id"] == null ? null : json["hash_id"],
        title: json["title"] == null ? null : json["title"],
        mp3: json["mp3"] == null ? null : json["mp3"],
        artist: json["artist"] == null ? null : json["artist"],
        song: json["song"] == null ? null : json["song"],
        hqLink: json["hq_link"] == null ? null : json["hq_link"],
        link: json["link"] == null ? null : json["link"],
        filename: json["filename"] == null ? null : json["filename"],
        shareLink: json["share_link"] == null ? null : json["share_link"],
        photo: json["photo"] == null ? null : json["photo"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        verified: json["verified"] == null ? null : json["verified"],
        type: json["type"] == null ? null : json["type"],
        likes: json["likes"] == null ? null : json["likes"],
        likesPretty: json["likes_pretty"] == null ? null : json["likes_pretty"],
        hls: json["hls"] == null ? null : json["hls"],
        hdvc: json["hdvc"] == null ? null : json["hdvc"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        location: json["location"] == null ? null : json["location"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "hash_id": hashId == null ? null : hashId,
        "title": title == null ? null : title,
        "mp3": mp3 == null ? null : mp3,
        "artist": artist == null ? null : artist,
        "song": song == null ? null : song,
        "hq_link": hqLink == null ? null : hqLink,
        "link": link == null ? null : link,
        "filename": filename == null ? null : filename,
        "share_link": shareLink == null ? null : shareLink,
        "photo": photo == null ? null : photo,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "verified": verified == null ? null : verified,
        "type": type == null ? null : type,
        "likes": likes == null ? null : likes,
        "likes_pretty": likesPretty == null ? null : likesPretty,
        "hls": hls == null ? null : hls,
        "hdvc": hdvc == null ? null : hdvc,
        "user": user == null ? null : user!.toJson(),
        "location": location == null ? null : location,
    };
}

class User {
    User({
        this.thumbnail,
        this.displayName,
        this.username,
    });

    String? thumbnail;
    String? displayName;
    String? username;

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        displayName: json["display_name"] == null ? null : json["display_name"],
        username: json["username"] == null ? null : json["username"],
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail == null ? null : thumbnail,
        "display_name": displayName == null ? null : displayName,
        "username": username == null ? null : username,
    };
}
