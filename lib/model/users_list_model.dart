import 'dart:convert';

List<UserModel> userListModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userListModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.id,
    this.caption,
    this.media,
    this.createdAt,
    this.author,
    this.spot,
    this.relevantComments,
    this.numberOfComments,
    this.likedBy,
    this.numberOfLikes,
    this.tags,
  });

  String? id;
  Caption? caption;
  List<Media>? media;
  DateTime? createdAt;
  Author? author;
  Spot? spot;
  dynamic relevantComments;
  int? numberOfComments;
  List<Author>? likedBy;
  int? numberOfLikes;
  List<UserListModelTag>? tags;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        caption: Caption.fromJson(json["caption"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        author: Author.fromJson(json["author"]),
        spot: Spot.fromJson(json["spot"]),
        relevantComments: json["relevant_comments"],
        numberOfComments: json["number_of_comments"],
        likedBy:
            List<Author>.from(json["liked_by"].map((x) => Author.fromJson(x))),
        numberOfLikes: json["number_of_likes"],
        tags: json["tags"] == null
            ? null
            : List<UserListModelTag>.from(
                json["tags"].map((x) => UserListModelTag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption?.toJson(),
        "media": List<dynamic>.from(media!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "author": author?.toJson(),
        "spot": spot?.toJson(),
        "relevant_comments": relevantComments,
        "number_of_comments": numberOfComments,
        "liked_by": List<dynamic>.from(likedBy!.map((x) => x.toJson())),
        "number_of_likes": numberOfLikes,
        "tags": tags == null
            ? null
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
      };
}

class Author {
  Author({
    this.id,
    this.username,
    this.photoUrl,
    this.fullName,
    this.isPrivate,
    this.isVerified,
  });

  String? id;
  String? username;
  String? photoUrl;
  String? fullName;
  bool? isPrivate;
  bool? isVerified;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        username: json["username"],
        photoUrl: json["photo_url"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "photo_url": photoUrl,
        "full_name": fullName,
        "is_private": isPrivate,
        "is_verified": isVerified,
      };
}

class Caption {
  Caption({
    this.text,
    this.tags,
  });

  String? text;
  List<CaptionTag>? tags;

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        text: json["text"],
        tags: json["tags"] == null
            ? null
            : List<CaptionTag>.from(
                json["tags"].map((x) => CaptionTag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "tags": tags == null
            ? null
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
      };
}

class CaptionTag {
  CaptionTag({
    this.id,
    this.tagText,
    this.displayText,
    this.url,
    this.type,
  });

  String? id;
  String? tagText;
  String? displayText;
  String? url;
  TagType? type;

  factory CaptionTag.fromJson(Map<String, dynamic> json) => CaptionTag(
        id: json["id"],
        tagText: json["tag_text"],
        displayText: json["display_text"],
        url: json["url"],
        type: tagTypeValues.map![json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tag_text": tagText,
        "display_text": displayText,
        "url": url,
        "type": tagTypeValues.reverse![type],
      };
}

enum TagType { USER }

final tagTypeValues = EnumValues({"user": TagType.USER});

class Media {
  Media({
    this.url,
    this.type,
    this.blurHash,
  });

  String? url;
  MediaType? type;
  String? blurHash;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        url: json["url"],
        type: mediaTypeValues.map![json["type"]],
        blurHash: json["blur_hash"] == null ? null : json["blur_hash"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "type": mediaTypeValues.reverse![type],
        "blur_hash": blurHash == null ? null : blurHash,
      };
}

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({"image": MediaType.IMAGE});

class Spot {
  Spot({
    this.id,
    this.name,
    this.types,
    this.logo,
    this.location,
    this.isSaved,
  });

  String? id;
  String? name;
  List<TypeElement>? types;
  Media? logo;
  Location? location;
  bool? isSaved;

  factory Spot.fromJson(Map<String, dynamic> json) => Spot(
        id: json["id"],
        name: json["name"],
        types: List<TypeElement>.from(
            json["types"].map((x) => TypeElement.fromJson(x))),
        logo: Media.fromJson(json["logo"]),
        location: Location.fromJson(json["location"]),
        isSaved: json["is_saved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "types": List<dynamic>.from(types!.map((x) => x.toJson())),
        "logo": logo?.toJson(),
        "location": location?.toJson(),
        "is_saved": isSaved,
      };
}

class Location {
  Location({
    this.latitude,
    this.longitude,
    this.display,
  });

  double? latitude;
  double? longitude;
  String? display;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        display: json["display"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "display": display,
      };
}

class TypeElement {
  TypeElement({
    this.id,
    this.name,
    this.url,
  });

  int? id;
  String? name;
  String? url;

  factory TypeElement.fromJson(Map<String, dynamic> json) => TypeElement(
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

class UserListModelTag {
  UserListModelTag({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory UserListModelTag.fromJson(Map<String, dynamic> json) =>
      UserListModelTag(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
