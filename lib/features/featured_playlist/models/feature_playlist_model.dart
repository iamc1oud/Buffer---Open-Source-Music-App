// To parse this JSON data, do
//
//     final featurePlaylistList = featurePlaylistListFromJson(jsonString);

import 'dart:convert';

FeaturePlaylistList featurePlaylistListFromJson(String str) =>
    FeaturePlaylistList.fromJson(json.decode(str));

String featurePlaylistListToJson(FeaturePlaylistList data) =>
    json.encode(data.toJson());

class FeaturePlaylistList {
  FeaturePlaylistList({
    this.status,
    this.results,
  });

  String? status;
  Results? results;

  factory FeaturePlaylistList.fromJson(Map<String, dynamic> json) =>
      FeaturePlaylistList(
        status: json["status"],
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results?.toJson(),
      };
}

class Results {
  Results({
    this.id,
    this.name,
    this.followerCount,
    this.songCount,
    this.fanCount,
    this.username,
    this.firstname,
    this.lastname,
    this.image,
    this.url,
    this.songs,
  });

  String? id;
  String? name;
  String? followerCount;
  String? songCount;
  int? fanCount;
  String? username;
  String? firstname;
  String? lastname;
  List<Image>? image;
  String? url;
  List<Song>? songs;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        name: json["name"],
        followerCount: json["followerCount"],
        songCount: json["songCount"],
        fanCount: json["fanCount"],
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
        url: json["url"],
        songs: List<Song>.from(json["songs"].map((x) => Song.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "followerCount": followerCount,
        "songCount": songCount,
        "fanCount": fanCount,
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "image": List<dynamic>.from(image!.map((x) => x.toJson())),
        "url": url,
        "songs": List<dynamic>.from(songs!.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    this.quality,
    this.link,
  });

  Quality? quality;
  String? link;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        quality: qualityValues.map?[json["quality"]],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "quality": qualityValues.reverse?[quality],
        "link": link,
      };
}

enum Quality {
  THE_50_X50,
  THE_150_X150,
  THE_500_X500,
  THE_12_KBPS,
  THE_48_KBPS,
  THE_96_KBPS,
  THE_160_KBPS,
  THE_320_KBPS
}

final qualityValues = EnumValues({
  "12kbps": Quality.THE_12_KBPS,
  "150x150": Quality.THE_150_X150,
  "160kbps": Quality.THE_160_KBPS,
  "320kbps": Quality.THE_320_KBPS,
  "48kbps": Quality.THE_48_KBPS,
  "500x500": Quality.THE_500_X500,
  "50x50": Quality.THE_50_X50,
  "96kbps": Quality.THE_96_KBPS
});

class Song {
  Song({
    this.id,
    this.name,
    this.album,
    this.year,
    this.releaseDate,
    this.duration,
    this.label,
    this.primaryArtists,
    this.primaryArtistsId,
    this.explicitContent,
    this.playCount,
    this.language,
    this.hasLyrics,
    this.artist,
    this.image,
    this.url,
    this.copyright,
    this.downloadUrl,
  });

  String? id;
  String? name;
  Album? album;
  String? year;
  DateTime? releaseDate;
  String? duration;
  String? label;
  String? primaryArtists;
  String? primaryArtistsId;
  int? explicitContent;
  String? playCount;
  Language? language;
  String? hasLyrics;
  String? artist;
  List<Image>? image;
  String? url;
  String? copyright;
  List<Image>? downloadUrl;

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json["id"],
        name: json["name"],
        album: Album.fromJson(json["album"]),
        year: json["year"],
        releaseDate: DateTime.tryParse(json["releaseDate"]),
        duration: json["duration"],
        label: json["label"],
        primaryArtists: json["primaryArtists"],
        primaryArtistsId: json["primaryArtistsId"],
        explicitContent: json["explicitContent"],
        playCount: json["playCount"],
        language: languageValues.map?[json["language"]],
        hasLyrics: json["hasLyrics"],
        artist: json["artist"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
        url: json["url"],
        copyright: json["copyright"],
        downloadUrl:
            List<Image>.from(json["downloadUrl"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "album": album?.toJson(),
        "year": year,
        "releaseDate":
            "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "duration": duration,
        "label": label,
        "primaryArtists": primaryArtists,
        "primaryArtistsId": primaryArtistsId,
        "explicitContent": explicitContent,
        "playCount": playCount,
        "language": languageValues.reverse?[language],
        "hasLyrics": hasLyrics,
        "artist": artist,
        "image": List<dynamic>.from(image!.map((x) => x.toJson())),
        "url": url,
        "copyright": copyright,
        "downloadUrl": List<dynamic>.from(downloadUrl!.map((x) => x.toJson())),
      };
}

class Album {
  Album({
    this.id,
    this.name,
    this.url,
  });

  String? id;
  String? name;
  String? url;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

enum Language { ENGLISH }

final languageValues = EnumValues({"english": Language.ENGLISH});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
