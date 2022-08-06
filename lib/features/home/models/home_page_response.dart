// To parse this JSON data, do
//
//     final homeData = homeDataFromJson(jsonString);

import 'dart:convert';

HomeData homeDataFromJson(String str) => HomeData.fromJson(json.decode(str));

class HomeData {
  HomeData({
    this.status,
    this.results,
  });

  String? status;
  Results? results;

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
        status: json["status"],
        results: Results.fromJson(json["results"]),
      );
}

class Results {
  Results({
    this.history,
    this.newTrending,
    this.topPlaylists,
    this.newAlbums,
    this.browseDiscover,
    this.globalConfig,
    this.charts,
    this.radio,
    this.artistRecos,
    this.tagMixes,
    this.cityMod,
    this.promoVxData32,
    this.promoVxData68,
    this.promoVxData76,
    this.promoVxData113,
    this.promoVxData116,
    this.modules,
    this.greeting,
  });

  List<dynamic>? history;
  List<NewTrending>? newTrending;
  List<TopPlaylist>? topPlaylists;
  List<NewAlbum>? newAlbums;
  List<BrowseDiscover>? browseDiscover;
  GlobalConfig? globalConfig;
  List<Chart>? charts;
  List<Radio>? radio;
  List<ArtistReco>? artistRecos;
  List<TagMix>? tagMixes;
  List<CityMod>? cityMod;
  List<PromoVxData32>? promoVxData32;
  List<PromoVxData68>? promoVxData68;
  List<PromoVxData76>? promoVxData76;
  List<PromoVxData11>? promoVxData113;
  List<PromoVxData11>? promoVxData116;
  Modules? modules;
  String? greeting;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        history: List<dynamic>.from(json["history"].map((x) => x)),
        newTrending: List<NewTrending>.from(
            json["new_trending"].map((x) => NewTrending.fromJson(x))),
        topPlaylists: List<TopPlaylist>.from(
            json["top_playlists"].map((x) => TopPlaylist.fromJson(x))),
        newAlbums: List<NewAlbum>.from(
            json["new_albums"].map((x) => NewAlbum.fromJson(x))),
        browseDiscover: List<BrowseDiscover>.from(
            json["browse_discover"].map((x) => BrowseDiscover.fromJson(x))),
        globalConfig: GlobalConfig.fromJson(json["global_config"]),
        charts: List<Chart>.from(json["charts"].map((x) => Chart.fromJson(x))),
        radio: List<Radio>.from(json["radio"].map((x) => Radio.fromJson(x))),
        artistRecos: List<ArtistReco>.from(
            json["artist_recos"].map((x) => ArtistReco.fromJson(x))),
        tagMixes:
            List<TagMix>.from(json["tag_mixes"].map((x) => TagMix.fromJson(x))),
        cityMod: List<CityMod>.from(
            json["city_mod"].map((x) => CityMod.fromJson(x))),
        promoVxData32: List<PromoVxData32>.from(
            json["promo:vx:data:32"].map((x) => PromoVxData32.fromJson(x))),
        promoVxData68: List<PromoVxData68>.from(
            json["promo:vx:data:68"].map((x) => PromoVxData68.fromJson(x))),
        promoVxData76: List<PromoVxData76>.from(
            json["promo:vx:data:76"].map((x) => PromoVxData76.fromJson(x))),
        promoVxData113: List<PromoVxData11>.from(
            json["promo:vx:data:113"].map((x) => PromoVxData11.fromJson(x))),
        promoVxData116: List<PromoVxData11>.from(
            json["promo:vx:data:116"].map((x) => PromoVxData11.fromJson(x))),
        modules: Modules.fromJson(json["modules"]),
        greeting: json["greeting"],
      );
}

class ArtistReco {
  ArtistReco({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
  });

  String? id;
  String? title;
  ArtistRecoSubtitle? subtitle;
  ArtistRecoType? type;
  String? image;
  String? permaUrl;
  ArtistRecoMoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  factory ArtistReco.fromJson(Map<String, dynamic> json) => ArtistReco(
        id: json["id"],
        title: json["title"],
        subtitle: artistRecoSubtitleValues.map?[json["subtitle"]],
        type: artistRecoTypeValues.map?[json["type"]],
        image: json["image"],
        permaUrl: json["perma_url"],
        moreInfo: ArtistRecoMoreInfo.fromJson(json["more_info"]),
        explicitContent: json["explicit_content"],
        miniObj: json["mini_obj"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": artistRecoSubtitleValues.reverse[subtitle],
        "type": artistRecoTypeValues.reverse[type],
        "image": image,
        "perma_url": permaUrl,
        "more_info": moreInfo?.toJson(),
        "explicit_content": explicitContent,
        "mini_obj": miniObj,
      };
}

class ArtistRecoMoreInfo {
  ArtistRecoMoreInfo({
    this.featuredStationType,
    this.query,
    this.stationDisplayText,
  });

  FeaturedStationTypeEnum? featuredStationType;
  String? query;
  String? stationDisplayText;

  factory ArtistRecoMoreInfo.fromJson(Map<String, dynamic> json) =>
      ArtistRecoMoreInfo(
        featuredStationType:
            featuredStationTypeEnumValues.map?[json["featured_station_type"]],
        query: json["query"],
        stationDisplayText: json["station_display_text"],
      );

  Map<String, dynamic> toJson() => {
        "featured_station_type":
            featuredStationTypeEnumValues.reverse[featuredStationType],
        "query": query,
        "station_display_text": stationDisplayText,
      };
}

enum FeaturedStationTypeEnum { ARTIST }

final featuredStationTypeEnumValues =
    EnumValues({"artist": FeaturedStationTypeEnum.ARTIST});

enum ArtistRecoSubtitle { ARTIST_RADIO }

final artistRecoSubtitleValues =
    EnumValues({"Artist Radio": ArtistRecoSubtitle.ARTIST_RADIO});

enum ArtistRecoType { RADIO_STATION, SONG, PLAYLIST }

final artistRecoTypeValues = EnumValues({
  "playlist": ArtistRecoType.PLAYLIST,
  "radio_station": ArtistRecoType.RADIO_STATION,
  "song": ArtistRecoType.SONG
});

class BrowseDiscover {
  BrowseDiscover({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
  });

  String? id;
  String? title;
  String? subtitle;
  BrowseDiscoverType? type;
  String? image;
  String? permaUrl;
  BrowseDiscoverMoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  factory BrowseDiscover.fromJson(Map<String, dynamic> json) => BrowseDiscover(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        type: browseDiscoverTypeValues.map?[json["type"]],
        image: json["image"],
        permaUrl: json["perma_url"],
        moreInfo: BrowseDiscoverMoreInfo.fromJson(json["more_info"]),
        explicitContent: json["explicit_content"],
        miniObj: json["mini_obj"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "type": browseDiscoverTypeValues.reverse[type],
        "image": image,
        "perma_url": permaUrl,
        "more_info": moreInfo?.toJson(),
        "explicit_content": explicitContent,
        "mini_obj": miniObj,
      };
}

class BrowseDiscoverMoreInfo {
  BrowseDiscoverMoreInfo({
    this.badge,
    this.subType,
    this.available,
    this.isFeatured,
    this.tags,
    this.videoUrl,
    this.videoThumbnail,
  });

  String? badge;
  SubType? subType;
  String? available;
  String? isFeatured;
  dynamic? tags;
  String? videoUrl;
  String? videoThumbnail;

  factory BrowseDiscoverMoreInfo.fromJson(Map<String, dynamic> json) =>
      BrowseDiscoverMoreInfo(
        badge: json["badge"],
        subType: subTypeValues.map?[json["sub_type"]],
        available: json["available"],
        isFeatured: json["is_featured"],
        tags: json["tags"],
        videoUrl: json["video_url"],
        videoThumbnail: json["video_thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "badge": badge,
        "sub_type": subTypeValues.reverse[subType],
        "available": available,
        "is_featured": isFeatured,
        "tags": tags,
        "video_url": videoUrl,
        "video_thumbnail": videoThumbnail,
      };
}

enum SubType { GENRE, MOOD, MUSIC_PLUS, BRAND }

final subTypeValues = EnumValues({
  "brand": SubType.BRAND,
  "genre": SubType.GENRE,
  "mood": SubType.MOOD,
  "music_plus": SubType.MUSIC_PLUS
});

class TagsClass {
  TagsClass({
    this.seasonality,
    this.situation,
    this.mood,
    this.genre,
  });

  List<String>? seasonality;
  List<String>? situation;
  List<String>? mood;
  List<String>? genre;

  factory TagsClass.fromJson(Map<String, dynamic> json) => TagsClass(
        seasonality: json["seasonality"] == null
            ? null
            : List<String>.from(json["seasonality"].map((x) => x)),
        situation: json["situation"] == null
            ? null
            : List<String>.from(json["situation"].map((x) => x)),
        mood: json["mood"] == null
            ? null
            : List<String>.from(json["mood"].map((x) => x)),
        genre: json["genre"] == null
            ? null
            : List<String>.from(json["genre"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "seasonality": seasonality == null
            ? null
            : List<dynamic>.from(seasonality!.map((x) => x)),
        "situation": situation == null
            ? null
            : List<dynamic>.from(situation!.map((x) => x)),
        "mood": mood == null ? null : List<dynamic>.from(mood!.map((x) => x)),
        "genre":
            genre == null ? null : List<dynamic>.from(genre!.map((x) => x)),
      };
}

enum BrowseDiscoverType { CHANNEL }

final browseDiscoverTypeValues =
    EnumValues({"channel": BrowseDiscoverType.CHANNEL});

class Chart {
  Chart({
    this.image,
    this.title,
    this.listname,
    this.permaUrl,
    this.id,
    this.type,
    this.moreInfo,
    this.subtitle,
    this.explicitContent,
    this.miniObj,
    this.language,
  });

  String? image;
  String? title;
  String? listname;
  String? permaUrl;
  String? id;
  ArtistRecoType? type;
  ChartMoreInfo? moreInfo;
  FirstnameEnum? subtitle;
  String? explicitContent;
  bool? miniObj;
  Language? language;

  factory Chart.fromJson(Map<String, dynamic> json) => Chart(
        image: json["image"],
        title: json["title"],
        listname: json["listname"],
        permaUrl: json["perma_url"],
        id: json["id"],
        type: artistRecoTypeValues.map?[json["type"]],
        moreInfo: ChartMoreInfo.fromJson(json["more_info"]),
        subtitle: json["subtitle"] == null
            ? null
            : firstnameEnumValues.map?[json["subtitle"]],
        explicitContent: json["explicit_content"],
        miniObj: json["mini_obj"],
        language: json["language"] == null
            ? null
            : languageValues.map?[json["language"]],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "listname": listname,
        "perma_url": permaUrl,
        "id": id,
        "type": artistRecoTypeValues.reverse[type],
        "more_info": moreInfo?.toJson(),
        "subtitle":
            subtitle == null ? null : firstnameEnumValues.reverse[subtitle],
        "explicit_content": explicitContent,
        "mini_obj": miniObj,
        "language": language == null ? null : languageValues.reverse[language],
      };
}

enum Language { HINDI, EMPTY }

final languageValues =
    EnumValues({"": Language.EMPTY, "hindi": Language.HINDI});

class ChartMoreInfo {
  ChartMoreInfo({
    this.songCount,
    this.firstname,
  });

  int? songCount;
  FirstnameEnum? firstname;

  factory ChartMoreInfo.fromJson(Map<String, dynamic> json) => ChartMoreInfo(
        songCount: json["song_count"],
        firstname: json["firstname"] == null
            ? null
            : firstnameEnumValues.map?[json["firstname"]],
      );

  Map<String, dynamic> toJson() => {
        "song_count": songCount,
        "firstname":
            firstname == null ? null : firstnameEnumValues.reverse[firstname],
      };
}

enum FirstnameEnum { JIO_SAAVN }

final firstnameEnumValues = EnumValues({"JioSaavn": FirstnameEnum.JIO_SAAVN});

class CityMod {
  CityMod({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
  });

  String? id;
  String? title;
  CityModSubtitle? subtitle;
  ArtistRecoType? type;
  String? image;
  String? permaUrl;
  CityModMoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  factory CityMod.fromJson(Map<String, dynamic> json) => CityMod(
        id: json["id"],
        title: json["title"],
        subtitle: cityModSubtitleValues.map?[json["subtitle"]],
        type: artistRecoTypeValues.map?[json["type"]],
        image: json["image"],
        permaUrl: json["perma_url"],
        moreInfo: CityModMoreInfo.fromJson(json["more_info"]),
        explicitContent: json["explicit_content"],
        miniObj: json["mini_obj"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": cityModSubtitleValues.reverse[subtitle],
        "type": artistRecoTypeValues.reverse[type],
        "image": image,
        "perma_url": permaUrl,
        "more_info": moreInfo?.toJson(),
        "explicit_content": explicitContent,
        "mini_obj": miniObj,
      };
}

class CityModMoreInfo {
  CityModMoreInfo({
    this.albumId,
    this.multipleTunes,
    this.videoAvailable,
    this.subTypes,
    this.featuredStationType,
    this.query,
  });

  String? albumId;
  List<MultipleTune>? multipleTunes;
  dynamic? videoAvailable;
  dynamic? subTypes;
  FeaturedStationTypeEnum? featuredStationType;
  String? query;

  factory CityModMoreInfo.fromJson(Map<String, dynamic> json) =>
      CityModMoreInfo(
        albumId: json["album_id"],
        multipleTunes: json["multiple_tunes"] == null
            ? null
            : List<MultipleTune>.from(
                json["multiple_tunes"].map((x) => MultipleTune.fromJson(x))),
        videoAvailable: json["video_available"],
        subTypes: json["sub_types"],
        featuredStationType: json["featured_station_type"] == null
            ? null
            : featuredStationTypeEnumValues.map?[json["featured_station_type"]],
        query: json["query"],
      );

  Map<String, dynamic> toJson() => {
        "album_id": albumId,
        "multiple_tunes": multipleTunes == null
            ? null
            : List<dynamic>.from(multipleTunes!.map((x) => x.toJson())),
        "video_available": videoAvailable,
        "sub_types": subTypes,
        "featured_station_type": featuredStationType == null
            ? null
            : featuredStationTypeEnumValues.reverse[featuredStationType],
        "query": query,
      };
}

class MultipleTune {
  MultipleTune({
    this.id,
    this.title,
    this.type,
    this.subtype,
    this.vcode,
    this.vlink,
  });

  String? id;
  String? title;
  MultipleTuneType? type;
  Subtype? subtype;
  String? vcode;
  String? vlink;

  factory MultipleTune.fromJson(Map<String, dynamic> json) => MultipleTune(
        id: json["id"],
        title: json["title"],
        type: multipleTuneTypeValues.map?[json["type"]],
        subtype: subtypeValues.map?[json["subtype"]],
        vcode: json["vcode"],
        vlink: json["vlink"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": multipleTuneTypeValues.reverse[type],
        "subtype": subtypeValues.reverse[subtype],
        "vcode": vcode,
        "vlink": vlink,
      };
}

enum Subtype { SONG_TUNE }

final subtypeValues = EnumValues({"songTune": Subtype.SONG_TUNE});

enum MultipleTuneType { JIOTUNE }

final multipleTuneTypeValues =
    EnumValues({"jiotune": MultipleTuneType.JIOTUNE});

enum CityModSubtitle { EMPTY, BY_JIO_SAAVN }

final cityModSubtitleValues = EnumValues(
    {"by JioSaavn": CityModSubtitle.BY_JIO_SAAVN, "": CityModSubtitle.EMPTY});

class GlobalConfig {
  GlobalConfig({
    this.weeklyTopSongsListid,
    this.randomSongsListid,
    this.phnOtpProviders,
  });

  WeeklyTopSongsListid? weeklyTopSongsListid;
  RandomSongsListid? randomSongsListid;
  PhnOtpProviders? phnOtpProviders;

  factory GlobalConfig.fromJson(Map<String, dynamic> json) => GlobalConfig(
        weeklyTopSongsListid:
            WeeklyTopSongsListid.fromJson(json["weekly_top_songs_listid"]),
        randomSongsListid:
            RandomSongsListid.fromJson(json["random_songs_listid"]),
        phnOtpProviders: PhnOtpProviders.fromJson(json["phn_otp_providers"]),
      );

  Map<String, dynamic> toJson() => {
        "weekly_top_songs_listid": weeklyTopSongsListid?.toJson(),
        "random_songs_listid": randomSongsListid?.toJson(),
        "phn_otp_providers": phnOtpProviders?.toJson(),
      };
}

class PhnOtpProviders {
  PhnOtpProviders({
    this.the91,
  });

  String? the91;

  factory PhnOtpProviders.fromJson(Map<String, dynamic> json) =>
      PhnOtpProviders(
        the91: json["+91"],
      );

  Map<String, dynamic> toJson() => {
        "+91": the91,
      };
}

class RandomSongsListid {
  RandomSongsListid({
    this.hindi,
  });

  RandomSongsListidHindi? hindi;

  factory RandomSongsListid.fromJson(Map<String, dynamic> json) =>
      RandomSongsListid(
        hindi: RandomSongsListidHindi.fromJson(json["hindi"]),
      );

  Map<String, dynamic> toJson() => {
        "hindi": hindi?.toJson(),
      };
}

class RandomSongsListidHindi {
  RandomSongsListidHindi({
    this.listid,
    this.image,
  });

  String? listid;
  String? image;

  factory RandomSongsListidHindi.fromJson(Map<String, dynamic> json) =>
      RandomSongsListidHindi(
        listid: json["listid"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "listid": listid,
        "image": image,
      };
}

class WeeklyTopSongsListid {
  WeeklyTopSongsListid({
    this.hindi,
  });

  WeeklyTopSongsListidHindi? hindi;

  factory WeeklyTopSongsListid.fromJson(Map<String, dynamic> json) =>
      WeeklyTopSongsListid(
        hindi: WeeklyTopSongsListidHindi.fromJson(json["hindi"]),
      );

  Map<String, dynamic> toJson() => {
        "hindi": hindi?.toJson(),
      };
}

class WeeklyTopSongsListidHindi {
  WeeklyTopSongsListidHindi({
    this.listid,
    this.image,
    this.count,
    this.title,
  });

  String? listid;
  String? image;
  int? count;
  String? title;

  factory WeeklyTopSongsListidHindi.fromJson(Map<String, dynamic> json) =>
      WeeklyTopSongsListidHindi(
        listid: json["listid"],
        image: json["image"],
        count: json["count"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "listid": listid,
        "image": image,
        "count": count,
        "title": title,
      };
}

class Modules {
  Modules({
    this.newTrending,
    this.charts,
    this.newAlbums,
    this.topPlaylists,
    this.radio,
    this.artistRecos,
    this.cityMod,
    this.promoVxData32,
    this.promoVxData68,
    this.promoVxData76,
    this.tagMixes,
    this.promoVxData113,
    this.promoVxData116,
  });

  Charts? newTrending;
  Charts? charts;
  Charts? newAlbums;
  Charts? topPlaylists;
  Charts? radio;
  ArtistRecos? artistRecos;
  ArtistRecos? cityMod;
  ArtistRecos? promoVxData32;
  ArtistRecos? promoVxData68;
  ArtistRecos? promoVxData76;
  ArtistRecos? tagMixes;
  ArtistRecos? promoVxData113;
  ArtistRecos? promoVxData116;

  factory Modules.fromJson(Map<String, dynamic> json) => Modules(
        newTrending: Charts.fromJson(json["new_trending"]),
        charts: Charts.fromJson(json["charts"]),
        newAlbums: Charts.fromJson(json["new_albums"]),
        topPlaylists: Charts.fromJson(json["top_playlists"]),
        radio: Charts.fromJson(json["radio"]),
        artistRecos: ArtistRecos.fromJson(json["artist_recos"]),
        cityMod: ArtistRecos.fromJson(json["city_mod"]),
        promoVxData32: ArtistRecos.fromJson(json["promo:vx:data:32"]),
        promoVxData68: ArtistRecos.fromJson(json["promo:vx:data:68"]),
        promoVxData76: ArtistRecos.fromJson(json["promo:vx:data:76"]),
        tagMixes: ArtistRecos.fromJson(json["tag_mixes"]),
        promoVxData113: ArtistRecos.fromJson(json["promo:vx:data:113"]),
        promoVxData116: ArtistRecos.fromJson(json["promo:vx:data:116"]),
      );
}

class ArtistRecos {
  ArtistRecos({
    this.source,
    this.position,
    this.scrollType,
    this.title,
    this.subtitle,
    this.highlight,
    this.simpleHeader,
    this.noHeader,
    this.hideMeta,
    this.viewMore,
    this.isJtModule,
  });

  String? source;
  int? position;
  String? scrollType;
  String? title;
  String? subtitle;
  String? highlight;
  bool? simpleHeader;
  bool? noHeader;
  bool? hideMeta;
  List<dynamic>? viewMore;
  bool? isJtModule;

  factory ArtistRecos.fromJson(Map<String, dynamic> json) => ArtistRecos(
        source: json["source"],
        position: json["position"],
        scrollType: json["scroll_type"],
        title: json["title"],
        subtitle: json["subtitle"],
        highlight: json["highlight"],
        simpleHeader: json["simpleHeader"],
        noHeader: json["noHeader"],
        hideMeta: json["hideMeta"],
        viewMore: List<dynamic>.from(json["view_more"].map((x) => x)),
        isJtModule: json["is_JT_module"],
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        "position": position,
        "scroll_type": scrollType,
        "title": title,
        "subtitle": subtitle,
        "highlight": highlight,
        "simpleHeader": simpleHeader,
        "noHeader": noHeader,
        "hideMeta": hideMeta,
        "view_more": List<dynamic>.from(viewMore!.map((x) => x)),
        "is_JT_module": isJtModule,
      };
}

class Charts {
  Charts({
    this.source,
    this.position,
    this.scrollType,
    this.title,
    this.subtitle,
    this.highlight,
    this.simpleHeader,
    this.noHeader,
    this.hideMeta,
    this.featured,
    this.featuredText,
    this.viewMore,
    this.isJtModule,
  });

  String? source;
  int? position;
  String? scrollType;
  String? title;
  String? subtitle;
  String? highlight;
  bool? simpleHeader;
  bool? noHeader;
  bool? hideMeta;
  bool? featured;
  String? featuredText;
  ViewMore? viewMore;
  bool? isJtModule;

  factory Charts.fromJson(Map<String, dynamic> json) => Charts(
        source: json["source"],
        position: json["position"],
        scrollType: json["scroll_type"],
        title: json["title"],
        subtitle: json["subtitle"],
        highlight: json["highlight"],
        simpleHeader: json["simpleHeader"],
        noHeader: json["noHeader"],
        hideMeta: json["hideMeta"],
        featured: json["featured"],
        featuredText: json["featured_text"],
        viewMore: ViewMore.fromJson(json["view_more"]),
        isJtModule: json["is_JT_module"],
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        "position": position,
        "scroll_type": scrollType,
        "title": title,
        "subtitle": subtitle,
        "highlight": highlight,
        "simpleHeader": simpleHeader,
        "noHeader": noHeader,
        "hideMeta": hideMeta,
        "featured": featured,
        "featured_text": featuredText,
        "view_more": viewMore?.toJson(),
        "is_JT_module": isJtModule,
      };
}

class ViewMore {
  ViewMore({
    this.api,
    this.pageParam,
    this.sizeParam,
    this.defaultSize,
    this.scrollType,
  });

  String? api;
  String? pageParam;
  String? sizeParam;
  int? defaultSize;
  String? scrollType;

  factory ViewMore.fromJson(Map<String, dynamic> json) => ViewMore(
        api: json["api"],
        pageParam: json["page_param"],
        sizeParam: json["size_param"],
        defaultSize: json["default_size"],
        scrollType: json["scroll_type"],
      );

  Map<String, dynamic> toJson() => {
        "api": api,
        "page_param": pageParam,
        "size_param": sizeParam,
        "default_size": defaultSize,
        "scroll_type": scrollType,
      };
}

class NewAlbum {
  NewAlbum({
    this.id,
    this.title,
    this.subtitle,
    this.headerDesc,
    this.type,
    this.permaUrl,
    this.image,
    this.language,
    this.year,
    this.playCount,
    this.explicitContent,
    this.listCount,
    this.listType,
    this.list,
    this.moreInfo,
  });

  String? id;
  String? title;
  NewAlbumSubtitle? subtitle;
  String? headerDesc;
  NewAlbumType? type;
  String? permaUrl;
  String? image;
  Language? language;
  String? year;
  String? playCount;
  String? explicitContent;
  String? listCount;
  String? listType;
  String? list;
  NewAlbumMoreInfo? moreInfo;

  factory NewAlbum.fromJson(Map<String, dynamic> json) => NewAlbum(
        id: json["id"],
        title: json["title"],
        subtitle: newAlbumSubtitleValues.map?[json["subtitle"]],
        headerDesc: json["header_desc"],
        type: newAlbumTypeValues.map?[json["type"]],
        permaUrl: json["perma_url"],
        image: json["image"],
        language: languageValues.map?[json["language"]],
        year: json["year"],
        playCount: json["play_count"],
        explicitContent: json["explicit_content"],
        listCount: json["list_count"],
        listType: json["list_type"],
        list: json["list"],
        moreInfo: NewAlbumMoreInfo.fromJson(json["more_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": newAlbumSubtitleValues.reverse[subtitle],
        "header_desc": headerDesc,
        "type": newAlbumTypeValues.reverse[type],
        "perma_url": permaUrl,
        "image": image,
        "language": languageValues.reverse[language],
        "year": year,
        "play_count": playCount,
        "explicit_content": explicitContent,
        "list_count": listCount,
        "list_type": listType,
        "list": list,
        "more_info": moreInfo?.toJson(),
      };
}

class NewAlbumMoreInfo {
  NewAlbumMoreInfo({
    this.songCount,
    this.releaseDate,
    this.artistMap,
    this.isWeekly,
    this.firstname,
    this.followerCount,
    this.fanCount,
  });

  String? songCount;
  String? releaseDate;
  ArtistMap? artistMap;
  String? isWeekly;
  FirstnameEnum? firstname;
  String? followerCount;
  String? fanCount;

  factory NewAlbumMoreInfo.fromJson(Map<String, dynamic> json) =>
      NewAlbumMoreInfo(
        songCount: json["song_count"],
        releaseDate: json["release_date"],
        artistMap: json["artistMap"] == null
            ? null
            : ArtistMap.fromJson(json["artistMap"]),
        isWeekly: json["isWeekly"],
        firstname: json["firstname"] == null
            ? null
            : firstnameEnumValues.map?[json["firstname"]],
        followerCount: json["follower_count"],
        fanCount: json["fan_count"],
      );

  Map<String, dynamic> toJson() => {
        "song_count": songCount,
        "release_date": releaseDate,
        "artistMap": artistMap?.toJson(),
        "isWeekly": isWeekly,
        "firstname":
            firstname == null ? null : firstnameEnumValues.reverse[firstname],
        "follower_count": followerCount,
        "fan_count": fanCount,
      };
}

class ArtistMap {
  ArtistMap({
    this.primaryArtists,
    this.featuredArtists,
    this.artists,
  });

  List<Artist>? primaryArtists;
  List<dynamic>? featuredArtists;
  List<Artist>? artists;

  factory ArtistMap.fromJson(Map<String, dynamic> json) => ArtistMap(
        primaryArtists: List<Artist>.from(
            json["primary_artists"].map((x) => Artist.fromJson(x))),
        featuredArtists:
            List<dynamic>.from(json["featured_artists"].map((x) => x)),
        artists:
            List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "primary_artists":
            List<dynamic>.from(primaryArtists!.map((x) => x.toJson())),
        "artists": List<dynamic>.from(artists!.map((x) => x.toJson())),
        "featured_artists": List<dynamic>.from(featuredArtists!.map((x) => x)),
      };
}

class Artist {
  Artist({
    this.id,
    this.name,
    this.role,
    this.image,
    this.type,
    this.permaUrl,
  });

  String? id;
  String? name;
  Role? role;
  String? image;
  FeaturedStationTypeEnum? type;
  String? permaUrl;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"],
        name: json["name"],
        role: roleValues.map?[json["role"]],
        image: json["image"],
        type: featuredStationTypeEnumValues.map?[json["type"]],
        permaUrl: json["perma_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": roleValues.reverse[role],
        "image": image,
        "type": featuredStationTypeEnumValues.reverse[type],
        "perma_url": permaUrl,
      };
}

enum Role { MUSIC, EMPTY, SINGER, STARRING }

final roleValues = EnumValues({
  "": Role.EMPTY,
  "music": Role.MUSIC,
  "singer": Role.SINGER,
  "starring": Role.STARRING
});

enum NewAlbumSubtitle { EMPTY, THE_261_FOLLOWERS, THE_319_K_FANS }

final newAlbumSubtitleValues = EnumValues({
  "": NewAlbumSubtitle.EMPTY,
  "261 Followers": NewAlbumSubtitle.THE_261_FOLLOWERS,
  "31.9K Fans": NewAlbumSubtitle.THE_319_K_FANS
});

enum NewAlbumType { PLAYLIST, ALBUM, SONG }

final newAlbumTypeValues = EnumValues({
  "album": NewAlbumType.ALBUM,
  "playlist": NewAlbumType.PLAYLIST,
  "song": NewAlbumType.SONG
});

class NewTrending {
  NewTrending({
    this.id,
    this.title,
    this.subtitle,
    this.headerDesc,
    this.type,
    this.permaUrl,
    this.image,
    this.language,
    this.year,
    this.playCount,
    this.explicitContent,
    this.listCount,
    this.listType,
    this.list,
    this.moreInfo,
    this.modules,
  });

  String? id;
  String? title;
  String? subtitle;
  String? headerDesc;
  NewAlbumType? type;
  String? permaUrl;
  String? image;
  Language? language;
  String? year;
  String? playCount;
  String? explicitContent;
  String? listCount;
  String? listType;
  String? list;
  NewTrendingMoreInfo? moreInfo;
  dynamic modules;

  factory NewTrending.fromJson(Map<String, dynamic> json) => NewTrending(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        headerDesc: json["header_desc"],
        type: newAlbumTypeValues.map?[json["type"]],
        permaUrl: json["perma_url"],
        image: json["image"],
        language: languageValues.map?[json["language"]],
        year: json["year"],
        playCount: json["play_count"],
        explicitContent: json["explicit_content"],
        listCount: json["list_count"],
        listType: json["list_type"],
        list: json["list"],
        moreInfo: NewTrendingMoreInfo.fromJson(json["more_info"]),
        modules: json["modules"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "header_desc": headerDesc,
        "type": newAlbumTypeValues.reverse[type],
        "perma_url": permaUrl,
        "image": image,
        "language": languageValues.reverse[language],
        "year": year,
        "play_count": playCount,
        "explicit_content": explicitContent,
        "list_count": listCount,
        "list_type": listType,
        "list": list,
        "more_info": moreInfo?.toJson(),
        "modules": modules,
      };
}

class NewTrendingMoreInfo {
  NewTrendingMoreInfo({
    this.isWeekly,
    this.firstname,
    this.songCount,
    this.followerCount,
    this.fanCount,
    this.releaseDate,
    this.artistMap,
    this.music,
    this.albumId,
    this.album,
    this.label,
    this.origin,
    this.isDolbyContent,
    this.the320Kbps,
    this.encryptedMediaUrl,
    this.encryptedCacheUrl,
    this.albumUrl,
    this.duration,
    this.rights,
    this.cacheState,
    this.hasLyrics,
    this.lyricsSnippet,
    this.starred,
    this.copyrightText,
    this.labelUrl,
    this.vcode,
    this.vlink,
    this.trillerAvailable,
    this.webp,
    this.lyricsId,
  });

  String? isWeekly;
  FirstnameEnum? firstname;
  String? songCount;
  String? followerCount;
  String? fanCount;
  DateTime? releaseDate;
  ArtistMap? artistMap;
  String? music;
  String? albumId;
  String? album;
  String? label;
  String? origin;
  bool? isDolbyContent;
  String? the320Kbps;
  String? encryptedMediaUrl;
  String? encryptedCacheUrl;
  String? albumUrl;
  String? duration;
  Rights? rights;
  String? cacheState;
  String? hasLyrics;
  String? lyricsSnippet;
  String? starred;
  String? copyrightText;
  String? labelUrl;
  String? vcode;
  String? vlink;
  bool? trillerAvailable;
  String? webp;
  String? lyricsId;

  factory NewTrendingMoreInfo.fromJson(Map<String, dynamic> json) =>
      NewTrendingMoreInfo(
        isWeekly: json["isWeekly"],
        firstname: json["firstname"] == null
            ? null
            : firstnameEnumValues.map?[json["firstname"]],
        songCount: json["song_count"],
        followerCount: json["follower_count"],
        fanCount: json["fan_count"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        artistMap: json["artistMap"] == null
            ? null
            : ArtistMap.fromJson(json["artistMap"]),
        music: json["music"],
        albumId: json["album_id"],
        album: json["album"],
        label: json["label"],
        origin: json["origin"],
        isDolbyContent: json["is_dolby_content"],
        the320Kbps: json["320kbps"],
        encryptedMediaUrl: json["encrypted_media_url"],
        encryptedCacheUrl: json["encrypted_cache_url"],
        albumUrl: json["album_url"],
        duration: json["duration"],
        rights: json["rights"] == null ? null : Rights.fromJson(json["rights"]),
        cacheState: json["cache_state"],
        hasLyrics: json["has_lyrics"],
        lyricsSnippet: json["lyrics_snippet"],
        starred: json["starred"],
        copyrightText: json["copyright_text"],
        labelUrl: json["label_url"],
        vcode: json["vcode"],
        vlink: json["vlink"],
        trillerAvailable: json["triller_available"],
        webp: json["webp"],
        lyricsId: json["lyrics_id"],
      );

  Map<String, dynamic> toJson() => {
        "isWeekly": isWeekly,
        "firstname":
            firstname == null ? null : firstnameEnumValues.reverse[firstname],
        "song_count": songCount,
        "follower_count": followerCount,
        "fan_count": fanCount,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "artistMap": artistMap?.toJson(),
        "music": music,
        "album_id": albumId,
        "album": album,
        "label": label,
        "origin": origin,
        "is_dolby_content": isDolbyContent,
        "320kbps": the320Kbps,
        "encrypted_media_url": encryptedMediaUrl,
        "encrypted_cache_url": encryptedCacheUrl,
        "album_url": albumUrl,
        "duration": duration,
        "rights": rights?.toJson(),
        "cache_state": cacheState,
        "has_lyrics": hasLyrics,
        "lyrics_snippet": lyricsSnippet,
        "starred": starred,
        "copyright_text": copyrightText,
        "label_url": labelUrl,
        "vcode": vcode,
        "vlink": vlink,
        "triller_available": trillerAvailable,
        "webp": webp,
        "lyrics_id": lyricsId,
      };
}

class Rights {
  Rights({
    this.code,
    this.cacheable,
    this.deleteCachedObject,
    this.reason,
  });

  String? code;
  String? cacheable;
  String? deleteCachedObject;
  String? reason;

  factory Rights.fromJson(Map<String, dynamic> json) => Rights(
        code: json["code"],
        cacheable: json["cacheable"],
        deleteCachedObject: json["delete_cached_object"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "cacheable": cacheable,
        "delete_cached_object": deleteCachedObject,
        "reason": reason,
      };
}

class PromoVxData11 {
  PromoVxData11({
    this.id,
    this.title,
    this.subtitle,
    this.headerDesc,
    this.type,
    this.permaUrl,
    this.image,
    this.language,
    this.year,
    this.playCount,
    this.explicitContent,
    this.listCount,
    this.listType,
    this.list,
    this.moreInfo,
    this.modules,
  });

  String? id;
  String? title;
  String? subtitle;
  String? headerDesc;
  NewAlbumType? type;
  String? permaUrl;
  String? image;
  String? language;
  String? year;
  String? playCount;
  String? explicitContent;
  String? listCount;
  String? listType;
  String? list;
  PromoVxData113MoreInfo? moreInfo;
  dynamic modules;

  factory PromoVxData11.fromJson(Map<String, dynamic> json) => PromoVxData11(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        headerDesc: json["header_desc"],
        type: newAlbumTypeValues.map?[json["type"]],
        permaUrl: json["perma_url"],
        image: json["image"],
        language: json["language"],
        year: json["year"],
        playCount: json["play_count"],
        explicitContent: json["explicit_content"],
        listCount: json["list_count"],
        listType: json["list_type"],
        list: json["list"],
        moreInfo: PromoVxData113MoreInfo.fromJson(json["more_info"]),
        modules: json["modules"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "header_desc": headerDesc,
        "type": newAlbumTypeValues.reverse[type],
        "perma_url": permaUrl,
        "image": image,
        "language": language,
        "year": year,
        "play_count": playCount,
        "explicit_content": explicitContent,
        "list_count": listCount,
        "list_type": listType,
        "list": list,
        "more_info": moreInfo?.toJson(),
        "modules": modules,
      };
}

class PromoVxData113MoreInfo {
  PromoVxData113MoreInfo({
    this.releaseYear,
  });

  int? releaseYear;

  factory PromoVxData113MoreInfo.fromJson(Map<String, dynamic> json) =>
      PromoVxData113MoreInfo(
        releaseYear: json["release_year"],
      );

  Map<String, dynamic> toJson() => {
        "release_year": releaseYear,
      };
}

class PromoVxData32 {
  PromoVxData32({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
    this.headerDesc,
    this.language,
    this.year,
    this.playCount,
    this.listCount,
    this.listType,
    this.list,
    this.modules,
  });

  String? id;
  String? title;
  CityModSubtitle? subtitle;
  NewAlbumType? type;
  String? image;
  String? permaUrl;
  PromoVxData32MoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;
  String? headerDesc;
  String? language;
  String? year;
  String? playCount;
  String? listCount;
  String? listType;
  String? list;
  dynamic modules;

  factory PromoVxData32.fromJson(Map<String, dynamic> json) => PromoVxData32(
        id: json["id"],
        title: json["title"],
        subtitle: cityModSubtitleValues.map?[json["subtitle"]],
        type: newAlbumTypeValues.map?[json["type"]],
        image: json["image"],
        permaUrl: json["perma_url"],
        moreInfo: PromoVxData32MoreInfo.fromJson(json["more_info"]),
        explicitContent: json["explicit_content"],
        miniObj: json["mini_obj"],
        headerDesc: json["header_desc"],
        language: json["language"],
        year: json["year"],
        playCount: json["play_count"],
        listCount: json["list_count"],
        listType: json["list_type"],
        list: json["list"],
        modules: json["modules"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": cityModSubtitleValues.reverse[subtitle],
        "type": newAlbumTypeValues.reverse[type],
        "image": image,
        "perma_url": permaUrl,
        "more_info": moreInfo?.toJson(),
        "explicit_content": explicitContent,
        "mini_obj": miniObj,
        "header_desc": headerDesc,
        "language": language,
        "year": year,
        "play_count": playCount,
        "list_count": listCount,
        "list_type": listType,
        "list": list,
        "modules": modules,
      };
}

class PromoVxData32MoreInfo {
  PromoVxData32MoreInfo({
    this.videoAvailable,
    this.subTypes,
    this.position,
    this.editorialLanguage,
    this.releaseYear,
  });

  dynamic? videoAvailable;
  List<dynamic>? subTypes;
  String? position;
  Language? editorialLanguage;
  int? releaseYear;

  factory PromoVxData32MoreInfo.fromJson(Map<String, dynamic> json) =>
      PromoVxData32MoreInfo(
        videoAvailable: json["video_available"],
        subTypes: json["sub_types"] == null
            ? null
            : List<dynamic>.from(json["sub_types"].map((x) => x)),
        position: json["position"],
        editorialLanguage: json["editorial_language"] == null
            ? null
            : languageValues.map?[json["editorial_language"]],
        releaseYear: json["release_year"],
      );

  Map<String, dynamic> toJson() => {
        "video_available": videoAvailable,
        "sub_types": subTypes == null
            ? null
            : List<dynamic>.from(subTypes!.map((x) => x)),
        "position": position,
        "editorial_language": editorialLanguage == null
            ? null
            : languageValues.reverse[editorialLanguage],
        "release_year": releaseYear,
      };
}

class PromoVxData68 {
  PromoVxData68({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
  });

  String? id;
  String? title;
  CityModSubtitle? subtitle;
  ArtistRecoType? type;
  String? image;
  String? permaUrl;
  PromoVxData32MoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  factory PromoVxData68.fromJson(Map<String, dynamic> json) => PromoVxData68(
        id: json["id"],
        title: json["title"],
        subtitle: cityModSubtitleValues.map?[json["subtitle"]],
        type: artistRecoTypeValues.map?[json["type"]],
        image: json["image"],
        permaUrl: json["perma_url"],
        moreInfo: PromoVxData32MoreInfo.fromJson(json["more_info"]),
        explicitContent: json["explicit_content"],
        miniObj: json["mini_obj"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": cityModSubtitleValues.reverse[subtitle],
        "type": artistRecoTypeValues.reverse[type],
        "image": image,
        "perma_url": permaUrl,
        "more_info": moreInfo?.toJson(),
        "explicit_content": explicitContent,
        "mini_obj": miniObj,
      };
}

class PromoVxData76 {
  PromoVxData76({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
  });

  String? id;
  String? title;
  CityModSubtitle? subtitle;
  ArtistRecoType? type;
  String? image;
  String? permaUrl;
  PromoVxData76MoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  factory PromoVxData76.fromJson(Map<String, dynamic> json) => PromoVxData76(
        id: json["id"],
        title: json["title"],
        subtitle: cityModSubtitleValues.map?[json["subtitle"]],
        type: artistRecoTypeValues.map?[json["type"]],
        image: json["image"],
        permaUrl: json["perma_url"],
        moreInfo: PromoVxData76MoreInfo.fromJson(json["more_info"]),
        explicitContent: json["explicit_content"],
        miniObj: json["mini_obj"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": cityModSubtitleValues.reverse[subtitle],
        "type": artistRecoTypeValues.reverse[type],
        "image": image,
        "perma_url": permaUrl,
        "more_info": moreInfo?.toJson(),
        "explicit_content": explicitContent,
        "mini_obj": miniObj,
      };
}

class PromoVxData76MoreInfo {
  PromoVxData76MoreInfo({
    this.videoAvailable,
    this.subTypes,
  });

  dynamic videoAvailable;
  List<dynamic>? subTypes;

  factory PromoVxData76MoreInfo.fromJson(Map<String, dynamic> json) =>
      PromoVxData76MoreInfo(
        videoAvailable: json["video_available"],
        subTypes: List<dynamic>.from(json["sub_types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "video_available": videoAvailable,
        "sub_types": List<dynamic>.from(subTypes!.map((x) => x)),
      };
}

class Radio {
  Radio({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
  });

  String? id;
  String? title;
  RadioSubtitle? subtitle;
  ArtistRecoType? type;
  String? image;
  String? permaUrl;
  RadioMoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  factory Radio.fromJson(Map<String, dynamic> json) => Radio(
        id: json["id"],
        title: json["title"],
        subtitle: radioSubtitleValues.map?[json["subtitle"]],
        type: artistRecoTypeValues.map?[json["type"]],
        image: json["image"],
        permaUrl: json["perma_url"],
        moreInfo: RadioMoreInfo.fromJson(json["more_info"]),
        explicitContent: json["explicit_content"],
        miniObj: json["mini_obj"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": radioSubtitleValues.reverse[subtitle],
        "type": artistRecoTypeValues.reverse[type],
        "image": image,
        "perma_url": permaUrl,
        "more_info": moreInfo?.toJson(),
        "explicit_content": explicitContent,
        "mini_obj": miniObj,
      };
}

class RadioMoreInfo {
  RadioMoreInfo({
    this.description,
    this.featuredStationType,
    this.query,
    this.color,
    this.language,
    this.stationDisplayText,
  });

  String? description;
  FeaturedStationType? featuredStationType;
  String? query;
  String? color;
  Language? language;
  String? stationDisplayText;

  factory RadioMoreInfo.fromJson(Map<String, dynamic> json) => RadioMoreInfo(
        description: json["description"],
        featuredStationType:
            featuredStationTypeValues.map?[json["featured_station_type"]],
        query: json["query"],
        color: json["color"],
        language: languageValues.map?[json["language"]],
        stationDisplayText: json["station_display_text"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "featured_station_type":
            featuredStationTypeValues.reverse[featuredStationType],
        "query": query,
        "color": color,
        "language": languageValues.reverse[language],
        "station_display_text": stationDisplayText,
      };
}

enum FeaturedStationType { FEATURED }

final featuredStationTypeValues =
    EnumValues({"featured": FeaturedStationType.FEATURED});

enum RadioSubtitle { HINDI_RADIO }

final radioSubtitleValues =
    EnumValues({"Hindi Radio": RadioSubtitle.HINDI_RADIO});

class TagMix {
  TagMix({
    this.subtitle,
    this.description,
    this.id,
    this.title,
    this.headerDesc,
    this.type,
    this.permaUrl,
    this.image,
    this.language,
    this.year,
    this.playCount,
    this.explicitContent,
    this.listCount,
    this.listType,
    this.list,
    this.moreInfo,
  });

  String? subtitle;
  dynamic description;
  String? id;
  String? title;
  String? headerDesc;
  String? type;
  String? permaUrl;
  String? image;
  String? language;
  String? year;
  String? playCount;
  String? explicitContent;
  String? listCount;
  String? listType;
  String? list;
  TagMixMoreInfo? moreInfo;

  factory TagMix.fromJson(Map<String, dynamic> json) => TagMix(
        subtitle: json["subtitle"],
        description: json["description"],
        id: json["id"],
        title: json["title"],
        headerDesc: json["header_desc"],
        type: json["type"],
        permaUrl: json["perma_url"],
        image: json["image"],
        language: json["language"],
        year: json["year"],
        playCount: json["play_count"],
        explicitContent: json["explicit_content"],
        listCount: json["list_count"],
        listType: json["list_type"],
        list: json["list"],
        moreInfo: TagMixMoreInfo.fromJson(json["more_info"]),
      );

  Map<String, dynamic> toJson() => {
        "subtitle": subtitle,
        "description": description,
        "id": id,
        "title": title,
        "header_desc": headerDesc,
        "type": type,
        "perma_url": permaUrl,
        "image": image,
        "language": language,
        "year": year,
        "play_count": playCount,
        "explicit_content": explicitContent,
        "list_count": listCount,
        "list_type": listType,
        "list": list,
        "more_info": moreInfo?.toJson(),
      };
}

class TagMixMoreInfo {
  TagMixMoreInfo({
    this.firstname,
    this.lastname,
    this.type,
  });

  String? firstname;
  String? lastname;
  String? type;

  factory TagMixMoreInfo.fromJson(Map<String, dynamic> json) => TagMixMoreInfo(
        firstname: json["firstname"],
        lastname: json["lastname"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "type": type,
      };
}

class TopPlaylist {
  TopPlaylist({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
  });

  String? id;
  String? title;
  String? subtitle;
  ArtistRecoType? type;
  String? image;
  String? permaUrl;
  TopPlaylistMoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  factory TopPlaylist.fromJson(Map<String, dynamic> json) => TopPlaylist(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        type: artistRecoTypeValues.map?[json["type"]],
        image: json["image"],
        permaUrl: json["perma_url"],
        moreInfo: TopPlaylistMoreInfo.fromJson(json["more_info"]),
        explicitContent: json["explicit_content"],
        miniObj: json["mini_obj"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "type": artistRecoTypeValues.reverse[type],
        "image": image,
        "perma_url": permaUrl,
        "more_info": moreInfo?.toJson(),
        "explicit_content": explicitContent,
        "mini_obj": miniObj,
      };
}

class TopPlaylistMoreInfo {
  TopPlaylistMoreInfo({
    this.songCount,
    this.firstname,
    this.followerCount,
    this.lastUpdated,
    this.uid,
  });

  String? songCount;
  FirstnameEnum? firstname;
  String? followerCount;
  String? lastUpdated;
  Uid? uid;

  factory TopPlaylistMoreInfo.fromJson(Map<String, dynamic> json) =>
      TopPlaylistMoreInfo(
        songCount: json["song_count"],
        firstname: firstnameEnumValues.map?[json["firstname"]],
        followerCount: json["follower_count"],
        lastUpdated: json["last_updated"],
        uid: uidValues.map?[json["uid"]],
      );

  Map<String, dynamic> toJson() => {
        "song_count": songCount,
        "firstname": firstnameEnumValues.reverse[firstname],
        "follower_count": followerCount,
        "last_updated": lastUpdated,
        "uid": uidValues.reverse[uid],
      };
}

enum Uid { PHULKI_USER }

final uidValues = EnumValues({"phulki_user": Uid.PHULKI_USER});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap ?? {} as Map<T, String>;
  }
}
