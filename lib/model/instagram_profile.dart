// To parse this JSON data, do
//
//     final instagramProfile = instagramProfileFromJson(jsonString);

import 'dart:convert';

InstagramProfile instagramProfileFromJson(String str) => InstagramProfile.fromJson(json.decode(str));

String instagramProfileToJson(InstagramProfile data) => json.encode(data.toJson());

class InstagramProfile {
  String loggingPageId;
  bool showSuggestedProfiles;
  bool showFollowDialog;
  Graphql graphql;
  dynamic toastContentOnLoad;

  InstagramProfile({
    this.loggingPageId,
    this.showSuggestedProfiles,
    this.showFollowDialog,
    this.graphql,
    this.toastContentOnLoad,
  });

  factory InstagramProfile.fromJson(Map<String, dynamic> json) => InstagramProfile(
    loggingPageId: json["logging_page_id"],
    showSuggestedProfiles: json["show_suggested_profiles"],
    showFollowDialog: json["show_follow_dialog"],
    graphql: Graphql.fromJson(json["graphql"]),
    toastContentOnLoad: json["toast_content_on_load"],
  );

  Map<String, dynamic> toJson() => {
    "logging_page_id": loggingPageId,
    "show_suggested_profiles": showSuggestedProfiles,
    "show_follow_dialog": showFollowDialog,
    "graphql": graphql.toJson(),
    "toast_content_on_load": toastContentOnLoad,
  };
}

class Graphql {
  User user;

  Graphql({
    this.user,
  });

  factory Graphql.fromJson(Map<String, dynamic> json) => Graphql(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
  };
}

class User {
  String biography;
  bool blockedByViewer;
  dynamic restrictedByViewer;
  bool countryBlock;
  dynamic externalUrl;
  dynamic externalUrlLinkshimmed;
  EdgeFollowClass edgeFollowedBy;
  bool followedByViewer;
  EdgeFollowClass edgeFollow;
  bool followsViewer;
  String fullName;
  bool hasArEffects;
  bool hasChannel;
  bool hasBlockedViewer;
  int highlightReelCount;
  bool hasRequestedViewer;
  String id;
  bool isBusinessAccount;
  bool isJoinedRecently;
  String businessCategoryName;
  String categoryId;
  dynamic overallCategoryName;
  bool isPrivate;
  bool isVerified;
  EdgeMutualFollowedBy edgeMutualFollowedBy;
  String profilePicUrl;
  String profilePicUrlHd;
  bool requestedByViewer;
  String username;
  dynamic connectedFbPage;
  EdgeFelixVideoTimelineClass edgeFelixVideoTimeline;
  EdgeFelixVideoTimelineClass edgeOwnerToTimelineMedia;
  EdgeFelixVideoTimelineClass edgeSavedMedia;
  EdgeFelixVideoTimelineClass edgeMediaCollections;

  User({
    this.biography,
    this.blockedByViewer,
    this.restrictedByViewer,
    this.countryBlock,
    this.externalUrl,
    this.externalUrlLinkshimmed,
    this.edgeFollowedBy,
    this.followedByViewer,
    this.edgeFollow,
    this.followsViewer,
    this.fullName,
    this.hasArEffects,
    this.hasChannel,
    this.hasBlockedViewer,
    this.highlightReelCount,
    this.hasRequestedViewer,
    this.id,
    this.isBusinessAccount,
    this.isJoinedRecently,
    this.businessCategoryName,
    this.categoryId,
    this.overallCategoryName,
    this.isPrivate,
    this.isVerified,
    this.edgeMutualFollowedBy,
    this.profilePicUrl,
    this.profilePicUrlHd,
    this.requestedByViewer,
    this.username,
    this.connectedFbPage,
    this.edgeFelixVideoTimeline,
    this.edgeOwnerToTimelineMedia,
    this.edgeSavedMedia,
    this.edgeMediaCollections,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    biography: json["biography"],
    blockedByViewer: json["blocked_by_viewer"],
    restrictedByViewer: json["restricted_by_viewer"],
    countryBlock: json["country_block"],
    externalUrl: json["external_url"],
    externalUrlLinkshimmed: json["external_url_linkshimmed"],
    edgeFollowedBy: EdgeFollowClass.fromJson(json["edge_followed_by"]),
    followedByViewer: json["followed_by_viewer"],
    edgeFollow: EdgeFollowClass.fromJson(json["edge_follow"]),
    followsViewer: json["follows_viewer"],
    fullName: json["full_name"],
    hasArEffects: json["has_ar_effects"],
    hasChannel: json["has_channel"],
    hasBlockedViewer: json["has_blocked_viewer"],
    highlightReelCount: json["highlight_reel_count"],
    hasRequestedViewer: json["has_requested_viewer"],
    id: json["id"],
    isBusinessAccount: json["is_business_account"],
    isJoinedRecently: json["is_joined_recently"],
    businessCategoryName: json["business_category_name"],
    categoryId: json["category_id"],
    overallCategoryName: json["overall_category_name"],
    isPrivate: json["is_private"],
    isVerified: json["is_verified"],
    edgeMutualFollowedBy: EdgeMutualFollowedBy.fromJson(json["edge_mutual_followed_by"]),
    profilePicUrl: json["profile_pic_url"],
    profilePicUrlHd: json["profile_pic_url_hd"],
    requestedByViewer: json["requested_by_viewer"],
    username: json["username"],
    connectedFbPage: json["connected_fb_page"],
    edgeFelixVideoTimeline: EdgeFelixVideoTimelineClass.fromJson(json["edge_felix_video_timeline"]),
    edgeOwnerToTimelineMedia: EdgeFelixVideoTimelineClass.fromJson(json["edge_owner_to_timeline_media"]),
    edgeSavedMedia: EdgeFelixVideoTimelineClass.fromJson(json["edge_saved_media"]),
    edgeMediaCollections: EdgeFelixVideoTimelineClass.fromJson(json["edge_media_collections"]),
  );

  Map<String, dynamic> toJson() => {
    "biography": biography,
    "blocked_by_viewer": blockedByViewer,
    "restricted_by_viewer": restrictedByViewer,
    "country_block": countryBlock,
    "external_url": externalUrl,
    "external_url_linkshimmed": externalUrlLinkshimmed,
    "edge_followed_by": edgeFollowedBy.toJson(),
    "followed_by_viewer": followedByViewer,
    "edge_follow": edgeFollow.toJson(),
    "follows_viewer": followsViewer,
    "full_name": fullName,
    "has_ar_effects": hasArEffects,
    "has_channel": hasChannel,
    "has_blocked_viewer": hasBlockedViewer,
    "highlight_reel_count": highlightReelCount,
    "has_requested_viewer": hasRequestedViewer,
    "id": id,
    "is_business_account": isBusinessAccount,
    "is_joined_recently": isJoinedRecently,
    "business_category_name": businessCategoryName,
    "category_id": categoryId,
    "overall_category_name": overallCategoryName,
    "is_private": isPrivate,
    "is_verified": isVerified,
    "edge_mutual_followed_by": edgeMutualFollowedBy.toJson(),
    "profile_pic_url": profilePicUrl,
    "profile_pic_url_hd": profilePicUrlHd,
    "requested_by_viewer": requestedByViewer,
    "username": username,
    "connected_fb_page": connectedFbPage,
    "edge_felix_video_timeline": edgeFelixVideoTimeline.toJson(),
    "edge_owner_to_timeline_media": edgeOwnerToTimelineMedia.toJson(),
    "edge_saved_media": edgeSavedMedia.toJson(),
    "edge_media_collections": edgeMediaCollections.toJson(),
  };
}

class EdgeFelixVideoTimelineClass {
  int count;
  PageInfo pageInfo;
  List<EdgeFelixVideoTimelineEdge> edges;

  EdgeFelixVideoTimelineClass({
    this.count,
    this.pageInfo,
    this.edges,
  });

  factory EdgeFelixVideoTimelineClass.fromJson(Map<String, dynamic> json) => EdgeFelixVideoTimelineClass(
    count: json["count"],
    pageInfo: PageInfo.fromJson(json["page_info"]),
    edges: List<EdgeFelixVideoTimelineEdge>.from(json["edges"].map((x) => EdgeFelixVideoTimelineEdge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "page_info": pageInfo.toJson(),
    "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
  };
}

class EdgeFelixVideoTimelineEdge {
  PurpleNode node;

  EdgeFelixVideoTimelineEdge({
    this.node,
  });

  factory EdgeFelixVideoTimelineEdge.fromJson(Map<String, dynamic> json) => EdgeFelixVideoTimelineEdge(
    node: PurpleNode.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node.toJson(),
  };
}

class PurpleNode {
  String typename;
  String id;
  EdgeMediaToCaption edgeMediaToCaption;
  String shortcode;
  EdgeFollowClass edgeMediaToComment;
  bool commentsDisabled;
  int takenAtTimestamp;
  Dimensions dimensions;
  String displayUrl;
  EdgeFollowClass edgeLikedBy;
  EdgeFollowClass edgeMediaPreviewLike;
  dynamic location;
  dynamic gatingInfo;
  dynamic factCheckOverallRating;
  dynamic factCheckInformation;
  String mediaPreview;
  Owner owner;
  String thumbnailSrc;
  List<ThumbnailResource> thumbnailResources;
  bool isVideo;
  String accessibilityCaption;

  PurpleNode({
    this.typename,
    this.id,
    this.edgeMediaToCaption,
    this.shortcode,
    this.edgeMediaToComment,
    this.commentsDisabled,
    this.takenAtTimestamp,
    this.dimensions,
    this.displayUrl,
    this.edgeLikedBy,
    this.edgeMediaPreviewLike,
    this.location,
    this.gatingInfo,
    this.factCheckOverallRating,
    this.factCheckInformation,
    this.mediaPreview,
    this.owner,
    this.thumbnailSrc,
    this.thumbnailResources,
    this.isVideo,
    this.accessibilityCaption,
  });

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
    typename: json["__typename"],
    id: json["id"],
    edgeMediaToCaption: EdgeMediaToCaption.fromJson(json["edge_media_to_caption"]),
    shortcode: json["shortcode"],
    edgeMediaToComment: EdgeFollowClass.fromJson(json["edge_media_to_comment"]),
    commentsDisabled: json["comments_disabled"],
    takenAtTimestamp: json["taken_at_timestamp"],
    dimensions: Dimensions.fromJson(json["dimensions"]),
    displayUrl: json["display_url"],
    edgeLikedBy: EdgeFollowClass.fromJson(json["edge_liked_by"]),
    edgeMediaPreviewLike: EdgeFollowClass.fromJson(json["edge_media_preview_like"]),
    location: json["location"],
    gatingInfo: json["gating_info"],
    factCheckOverallRating: json["fact_check_overall_rating"],
    factCheckInformation: json["fact_check_information"],
    mediaPreview: json["media_preview"],
    owner: Owner.fromJson(json["owner"]),
    thumbnailSrc: json["thumbnail_src"],
    thumbnailResources: List<ThumbnailResource>.from(json["thumbnail_resources"].map((x) => ThumbnailResource.fromJson(x))),
    isVideo: json["is_video"],
    accessibilityCaption: json["accessibility_caption"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "id": id,
    "edge_media_to_caption": edgeMediaToCaption.toJson(),
    "shortcode": shortcode,
    "edge_media_to_comment": edgeMediaToComment.toJson(),
    "comments_disabled": commentsDisabled,
    "taken_at_timestamp": takenAtTimestamp,
    "dimensions": dimensions.toJson(),
    "display_url": displayUrl,
    "edge_liked_by": edgeLikedBy.toJson(),
    "edge_media_preview_like": edgeMediaPreviewLike.toJson(),
    "location": location,
    "gating_info": gatingInfo,
    "fact_check_overall_rating": factCheckOverallRating,
    "fact_check_information": factCheckInformation,
    "media_preview": mediaPreview,
    "owner": owner.toJson(),
    "thumbnail_src": thumbnailSrc,
    "thumbnail_resources": List<dynamic>.from(thumbnailResources.map((x) => x.toJson())),
    "is_video": isVideo,
    "accessibility_caption": accessibilityCaption,
  };
}

class Dimensions {
  int height;
  int width;

  Dimensions({
    this.height,
    this.width,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    height: json["height"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
  };
}

class EdgeFollowClass {
  int count;

  EdgeFollowClass({
    this.count,
  });

  factory EdgeFollowClass.fromJson(Map<String, dynamic> json) => EdgeFollowClass(
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
  };
}

class EdgeMediaToCaption {
  List<EdgeMediaToCaptionEdge> edges;

  EdgeMediaToCaption({
    this.edges,
  });

  factory EdgeMediaToCaption.fromJson(Map<String, dynamic> json) => EdgeMediaToCaption(
    edges: List<EdgeMediaToCaptionEdge>.from(json["edges"].map((x) => EdgeMediaToCaptionEdge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
  };
}

class EdgeMediaToCaptionEdge {
  FluffyNode node;

  EdgeMediaToCaptionEdge({
    this.node,
  });

  factory EdgeMediaToCaptionEdge.fromJson(Map<String, dynamic> json) => EdgeMediaToCaptionEdge(
    node: FluffyNode.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node.toJson(),
  };
}

class FluffyNode {
  String text;

  FluffyNode({
    this.text,
  });

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
  };
}

class Owner {
  String id;
  String username;

  Owner({
    this.id,
    this.username,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    id: json["id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
  };
}

class ThumbnailResource {
  String src;
  int configWidth;
  int configHeight;

  ThumbnailResource({
    this.src,
    this.configWidth,
    this.configHeight,
  });

  factory ThumbnailResource.fromJson(Map<String, dynamic> json) => ThumbnailResource(
    src: json["src"],
    configWidth: json["config_width"],
    configHeight: json["config_height"],
  );

  Map<String, dynamic> toJson() => {
    "src": src,
    "config_width": configWidth,
    "config_height": configHeight,
  };
}

class PageInfo {
  bool hasNextPage;
  dynamic endCursor;

  PageInfo({
    this.hasNextPage,
    this.endCursor,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    hasNextPage: json["has_next_page"],
    endCursor: json["end_cursor"],
  );

  Map<String, dynamic> toJson() => {
    "has_next_page": hasNextPage,
    "end_cursor": endCursor,
  };
}

class EdgeMutualFollowedBy {
  int count;
  List<dynamic> edges;

  EdgeMutualFollowedBy({
    this.count,
    this.edges,
  });

  factory EdgeMutualFollowedBy.fromJson(Map<String, dynamic> json) => EdgeMutualFollowedBy(
    count: json["count"],
    edges: List<dynamic>.from(json["edges"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "edges": List<dynamic>.from(edges.map((x) => x)),
  };
}
