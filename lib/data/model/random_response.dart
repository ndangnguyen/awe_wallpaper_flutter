import 'dart:convert';

class RandomResponse {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime promotedAt;
  int width;
  int height;
  String color;
  dynamic description;
  String altDescription;
  Urls urls;
  RandomResponseLinks links;
  List<dynamic> categories;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  User user;
  Exif exif;
  Location location;
  int views;
  int downloads;

  RandomResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.user,
    this.exif,
    this.location,
    this.views,
    this.downloads,
  });

  factory RandomResponse.fromRawJson(String str) => RandomResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RandomResponse.fromJson(Map<String, dynamic> json) => RandomResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    promotedAt: DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    description: json["description"],
    altDescription: json["alt_description"],
    urls: Urls.fromJson(json["urls"]),
    links: RandomResponseLinks.fromJson(json["links"]),
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"],
    user: User.fromJson(json["user"]),
    exif: Exif.fromJson(json["exif"]),
    location: Location.fromJson(json["location"]),
    views: json["views"],
    downloads: json["downloads"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "promoted_at": promotedAt.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "description": description,
    "alt_description": altDescription,
    "urls": urls.toJson(),
    "links": links.toJson(),
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    "sponsorship": sponsorship,
    "user": user.toJson(),
    "exif": exif.toJson(),
    "location": location.toJson(),
    "views": views,
    "downloads": downloads,
  };
}

class Exif {
  dynamic make;
  dynamic model;
  dynamic exposureTime;
  dynamic aperture;
  dynamic focalLength;
  dynamic iso;

  Exif({
    this.make,
    this.model,
    this.exposureTime,
    this.aperture,
    this.focalLength,
    this.iso,
  });

  factory Exif.fromRawJson(String str) => Exif.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Exif.fromJson(Map<String, dynamic> json) => Exif(
    make: json["make"],
    model: json["model"],
    exposureTime: json["exposure_time"],
    aperture: json["aperture"],
    focalLength: json["focal_length"],
    iso: json["iso"],
  );

  Map<String, dynamic> toJson() => {
    "make": make,
    "model": model,
    "exposure_time": exposureTime,
    "aperture": aperture,
    "focal_length": focalLength,
    "iso": iso,
  };
}

class RandomResponseLinks {
  String self;
  String html;
  String download;
  String downloadLocation;

  RandomResponseLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  factory RandomResponseLinks.fromRawJson(String str) => RandomResponseLinks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RandomResponseLinks.fromJson(Map<String, dynamic> json) => RandomResponseLinks(
    self: json["self"],
    html: json["html"],
    download: json["download"],
    downloadLocation: json["download_location"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "download": download,
    "download_location": downloadLocation,
  };
}

class Location {
  dynamic title;
  dynamic name;
  dynamic city;
  dynamic country;
  Position position;

  Location({
    this.title,
    this.name,
    this.city,
    this.country,
    this.position,
  });

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    title: json["title"],
    name: json["name"],
    city: json["city"],
    country: json["country"],
    position: Position.fromJson(json["position"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "name": name,
    "city": city,
    "country": country,
    "position": position.toJson(),
  };
}

class Position {
  dynamic latitude;
  dynamic longitude;

  Position({
    this.latitude,
    this.longitude,
  });

  factory Position.fromRawJson(String str) => Position.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  factory Urls.fromRawJson(String str) => Urls.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
  };
}

class User {
  String id;
  DateTime updatedAt;
  String username;
  String name;
  String firstName;
  String lastName;
  dynamic twitterUsername;
  String portfolioUrl;
  String bio;
  dynamic location;
  UserLinks links;
  ProfileImage profileImage;
  String instagramUsername;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  bool acceptedTos;

  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    twitterUsername: json["twitter_username"],
    portfolioUrl: json["portfolio_url"],
    bio: json["bio"],
    location: json["location"],
    links: UserLinks.fromJson(json["links"]),
    profileImage: ProfileImage.fromJson(json["profile_image"]),
    instagramUsername: json["instagram_username"],
    totalCollections: json["total_collections"],
    totalLikes: json["total_likes"],
    totalPhotos: json["total_photos"],
    acceptedTos: json["accepted_tos"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "updated_at": updatedAt.toIso8601String(),
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "twitter_username": twitterUsername,
    "portfolio_url": portfolioUrl,
    "bio": bio,
    "location": location,
    "links": links.toJson(),
    "profile_image": profileImage.toJson(),
    "instagram_username": instagramUsername,
    "total_collections": totalCollections,
    "total_likes": totalLikes,
    "total_photos": totalPhotos,
    "accepted_tos": acceptedTos,
  };
}

class UserLinks {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  factory UserLinks.fromRawJson(String str) => UserLinks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
    self: json["self"],
    html: json["html"],
    photos: json["photos"],
    likes: json["likes"],
    portfolio: json["portfolio"],
    following: json["following"],
    followers: json["followers"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "photos": photos,
    "likes": likes,
    "portfolio": portfolio,
    "following": following,
    "followers": followers,
  };
}

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  factory ProfileImage.fromRawJson(String str) => ProfileImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "medium": medium,
    "large": large,
  };
}
