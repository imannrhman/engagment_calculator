// To parse this JSON data, do
//
//     final searchResult = searchResultFromJson(jsonString);

import 'dart:convert';

SearchResult searchResultFromJson(String str) => SearchResult.fromJson(json.decode(str));

String searchResultToJson(SearchResult data) => json.encode(data.toJson());

class SearchResult {
  List<UserElement> users;
  List<dynamic> places;
  List<dynamic> hashtags;
  bool hasMore;
  String rankToken;
  bool clearClientCache;
  String status;

  SearchResult({
    this.users,
    this.places,
    this.hashtags,
    this.hasMore,
    this.rankToken,
    this.clearClientCache,
    this.status,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
    users: List<UserElement>.from(json["users"].map((x) => UserElement.fromJson(x))),
    places: List<dynamic>.from(json["places"].map((x) => x)),
    hashtags: List<dynamic>.from(json["hashtags"].map((x) => x)),
    hasMore: json["has_more"],
    rankToken: json["rank_token"],
    clearClientCache: json["clear_client_cache"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
    "places": List<dynamic>.from(places.map((x) => x)),
    "hashtags": List<dynamic>.from(hashtags.map((x) => x)),
    "has_more": hasMore,
    "rank_token": rankToken,
    "clear_client_cache": clearClientCache,
    "status": status,
  };
}

class UserElement {
  int position;
  UserUser user;

  UserElement({
    this.position,
    this.user,
  });

  factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
    position: json["position"],
    user: UserUser.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "position": position,
    "user": user.toJson(),
  };
}

class UserUser {
  String pk;
  String username;
  String fullName;
  bool isPrivate;
  String profilePicUrl;
  String profilePicId;
  bool isVerified;
  bool hasAnonymousProfilePicture;
  int mutualFollowersCount;
  int latestReelMedia;

  UserUser({
    this.pk,
    this.username,
    this.fullName,
    this.isPrivate,
    this.profilePicUrl,
    this.profilePicId,
    this.isVerified,
    this.hasAnonymousProfilePicture,
    this.mutualFollowersCount,
    this.latestReelMedia,
  });

  factory UserUser.fromJson(Map<String, dynamic> json) => UserUser(
    pk: json["pk"],
    username: json["username"],
    fullName: json["full_name"],
    isPrivate: json["is_private"],
    profilePicUrl: json["profile_pic_url"],
    profilePicId: json["profile_pic_id"],
    isVerified: json["is_verified"],
    hasAnonymousProfilePicture: json["has_anonymous_profile_picture"],
    mutualFollowersCount: json["mutual_followers_count"],
    latestReelMedia: json["latest_reel_media"],
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "username": username,
    "full_name": fullName,
    "is_private": isPrivate,
    "profile_pic_url": profilePicUrl,
    "profile_pic_id": profilePicId,
    "is_verified": isVerified,
    "has_anonymous_profile_picture": hasAnonymousProfilePicture,
    "mutual_followers_count": mutualFollowersCount,
    "latest_reel_media": latestReelMedia,
  };
}



class SearchResultError{
  final String message;

  SearchResultError({this.message});

}