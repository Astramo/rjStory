// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => StoryModel(
      id: json['id'] as int?,
      hashId: json['hashId'] as String?,
      title: json['title'] as String?,
      mp3: json['mp3'] as int?,
      artist: json['artist'] as String?,
      song: json['song'] as String?,
      hqLink: json['hqLink'] as String?,
      link: json['link'] as String?,
      filename: json['filename'] as String?,
      shareLink: json['shareLink'] as String?,
      photo: json['photo'] as String?,
      thumbnail: json['thumbnail'] as String?,
      verified: json['verified'] as bool?,
      type: json['type'] as String?,
      likes: json['likes'] as String?,
      likesPretty: json['likesPretty'] as String?,
      hls: json['hls'] as String?,
      hdvc: json['hdvc'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      location: json['location'] as String?,
    );

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hashId': instance.hashId,
      'title': instance.title,
      'mp3': instance.mp3,
      'artist': instance.artist,
      'song': instance.song,
      'hqLink': instance.hqLink,
      'link': instance.link,
      'filename': instance.filename,
      'shareLink': instance.shareLink,
      'photo': instance.photo,
      'thumbnail': instance.thumbnail,
      'verified': instance.verified,
      'type': instance.type,
      'likes': instance.likes,
      'likesPretty': instance.likesPretty,
      'hls': instance.hls,
      'hdvc': instance.hdvc,
      'user': instance.user,
      'location': instance.location,
    };
