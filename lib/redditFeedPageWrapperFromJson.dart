// To parse this JSON data, do
//
//     final redditPost = redditPostFromJson(jsonString);

import 'dart:convert';

RedditPost redditPostFromJson(String str) =>
    RedditPost.fromJson(json.decode(str));

String redditPostToJson(RedditPost data) => json.encode(data.toJson());

class RedditPost {
  String kind;
  RedditPostData data;

  RedditPost({
    this.kind,
    this.data,
  });

  factory RedditPost.fromJson(Map<String, dynamic> json) => RedditPost(
        kind: json["kind"],
        data: RedditPostData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "data": data.toJson(),
      };
}

class RedditPostData {
  String modhash;
  int dist;
  List<Child> children;
  String after;
  dynamic before;

  RedditPostData({
    this.modhash,
    this.dist,
    this.children,
    this.after,
    this.before,
  });

  factory RedditPostData.fromJson(Map<String, dynamic> json) => RedditPostData(
        modhash: json["modhash"],
        dist: json["dist"],
        children:
            List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
        after: json["after"],
        before: json["before"],
      );

  Map<String, dynamic> toJson() => {
        "modhash": modhash,
        "dist": dist,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
        "after": after,
        "before": before,
      };
}

class Child {
  Kind kind;
  ChildData data;

  Child({
    this.kind,
    this.data,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        kind: kindValues.map[json["kind"]],
        data: ChildData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kindValues.reverse[kind],
        "data": data.toJson(),
      };
}

class ChildData {
  dynamic approvedAtUtc;
  Subreddit subreddit;
  String selftext;
  String authorFullname;
  bool saved;
  dynamic modReasonTitle;
  int gilded;
  bool clicked;
  String title;
  List<LinkFlairRichtext> linkFlairRichtext;
  SubredditNamePrefixed subredditNamePrefixed;
  bool hidden;
  int pwls;
  String linkFlairCssClass;
  int downs;
  int thumbnailHeight;
  bool hideScore;
  String name;
  bool quarantine;
  FlairTextColor linkFlairTextColor;
  double upvoteRatio;
  String authorFlairBackgroundColor;
  SubredditType subredditType;
  int ups;
  int totalAwardsReceived;
  MediaEmbed mediaEmbed;
  int thumbnailWidth;
  String authorFlairTemplateId;
  bool isOriginalContent;
  List<dynamic> userReports;
  Media secureMedia;
  bool isRedditMediaDomain;
  bool isMeta;
  dynamic category;
  MediaEmbed secureMediaEmbed;
  String linkFlairText;
  bool canModPost;
  int score;
  dynamic approvedBy;
  bool authorPremium;
  String thumbnail;
  dynamic edited;
  String authorFlairCssClass;
  List<AuthorFlairRichtext> authorFlairRichtext;
  Gildings gildings;
  dynamic contentCategories;
  bool isSelf;
  dynamic modNote;
  int created;
  AuthorFlairType linkFlairType;
  int wls;
  dynamic removedByCategory;
  dynamic bannedBy;
  AuthorFlairType authorFlairType;
  Domain domain;
  bool allowLiveComments;
  String selftextHtml;
  dynamic likes;
  String suggestedSort;
  dynamic bannedAtUtc;
  dynamic viewCount;
  bool archived;
  bool noFollow;
  bool isCrosspostable;
  bool pinned;
  bool over18;
  List<AllAwarding> allAwardings;
  List<dynamic> awarders;
  bool mediaOnly;
  String linkFlairTemplateId;
  bool canGild;
  bool spoiler;
  bool locked;
  String authorFlairText;
  List<dynamic> treatmentTags;
  bool visited;
  dynamic removedBy;
  dynamic numReports;
  String distinguished;
  SubredditId subredditId;
  dynamic modReasonBy;
  dynamic removalReason;
  String linkFlairBackgroundColor;
  String id;
  bool isRobotIndexable;
  dynamic reportReasons;
  String author;
  dynamic discussionType;
  int numComments;
  bool sendReplies;
  WhitelistStatus whitelistStatus;
  bool contestMode;
  List<dynamic> modReports;
  bool authorPatreonFlair;
  FlairTextColor authorFlairTextColor;
  String permalink;
  WhitelistStatus parentWhitelistStatus;
  bool stickied;
  String url;
  int subredditSubscribers;
  int createdUtc;
  int numCrossposts;
  Media media;
  bool isVideo;
  PostHint postHint;
  Preview preview;

  ChildData({
    this.approvedAtUtc,
    this.subreddit,
    this.selftext,
    this.authorFullname,
    this.saved,
    this.modReasonTitle,
    this.gilded,
    this.clicked,
    this.title,
    this.linkFlairRichtext,
    this.subredditNamePrefixed,
    this.hidden,
    this.pwls,
    this.linkFlairCssClass,
    this.downs,
    this.thumbnailHeight,
    this.hideScore,
    this.name,
    this.quarantine,
    this.linkFlairTextColor,
    this.upvoteRatio,
    this.authorFlairBackgroundColor,
    this.subredditType,
    this.ups,
    this.totalAwardsReceived,
    this.mediaEmbed,
    this.thumbnailWidth,
    this.authorFlairTemplateId,
    this.isOriginalContent,
    this.userReports,
    this.secureMedia,
    this.isRedditMediaDomain,
    this.isMeta,
    this.category,
    this.secureMediaEmbed,
    this.linkFlairText,
    this.canModPost,
    this.score,
    this.approvedBy,
    this.authorPremium,
    this.thumbnail,
    this.edited,
    this.authorFlairCssClass,
    this.authorFlairRichtext,
    this.gildings,
    this.contentCategories,
    this.isSelf,
    this.modNote,
    this.created,
    this.linkFlairType,
    this.wls,
    this.removedByCategory,
    this.bannedBy,
    this.authorFlairType,
    this.domain,
    this.allowLiveComments,
    this.selftextHtml,
    this.likes,
    this.suggestedSort,
    this.bannedAtUtc,
    this.viewCount,
    this.archived,
    this.noFollow,
    this.isCrosspostable,
    this.pinned,
    this.over18,
    this.allAwardings,
    this.awarders,
    this.mediaOnly,
    this.linkFlairTemplateId,
    this.canGild,
    this.spoiler,
    this.locked,
    this.authorFlairText,
    this.treatmentTags,
    this.visited,
    this.removedBy,
    this.numReports,
    this.distinguished,
    this.subredditId,
    this.modReasonBy,
    this.removalReason,
    this.linkFlairBackgroundColor,
    this.id,
    this.isRobotIndexable,
    this.reportReasons,
    this.author,
    this.discussionType,
    this.numComments,
    this.sendReplies,
    this.whitelistStatus,
    this.contestMode,
    this.modReports,
    this.authorPatreonFlair,
    this.authorFlairTextColor,
    this.permalink,
    this.parentWhitelistStatus,
    this.stickied,
    this.url,
    this.subredditSubscribers,
    this.createdUtc,
    this.numCrossposts,
    this.media,
    this.isVideo,
    this.postHint,
    this.preview,
  });

  factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
        approvedAtUtc: json["approved_at_utc"],
        subreddit: subredditValues.map[json["subreddit"]],
        selftext: json["selftext"],
        authorFullname: json["author_fullname"],
        saved: json["saved"],
        modReasonTitle: json["mod_reason_title"],
        gilded: json["gilded"],
        clicked: json["clicked"],
        title: json["title"],
        linkFlairRichtext: List<LinkFlairRichtext>.from(
            json["link_flair_richtext"]
                .map((x) => LinkFlairRichtext.fromJson(x))),
        subredditNamePrefixed:
            subredditNamePrefixedValues.map[json["subreddit_name_prefixed"]],
        hidden: json["hidden"],
        pwls: json["pwls"],
        linkFlairCssClass: json["link_flair_css_class"],
        downs: json["downs"],
        thumbnailHeight:
            json["thumbnail_height"] == null ? null : json["thumbnail_height"],
        hideScore: json["hide_score"],
        name: json["name"],
        quarantine: json["quarantine"],
        linkFlairTextColor:
            flairTextColorValues.map[json["link_flair_text_color"]],
        upvoteRatio: json["upvote_ratio"].toDouble(),
        authorFlairBackgroundColor:
            json["author_flair_background_color"] == null
                ? null
                : json["author_flair_background_color"],
        subredditType: subredditTypeValues.map[json["subreddit_type"]],
        ups: json["ups"],
        totalAwardsReceived: json["total_awards_received"],
        mediaEmbed: MediaEmbed.fromJson(json["media_embed"]),
        thumbnailWidth:
            json["thumbnail_width"] == null ? null : json["thumbnail_width"],
        authorFlairTemplateId: json["author_flair_template_id"] == null
            ? null
            : json["author_flair_template_id"],
        isOriginalContent: json["is_original_content"],
        userReports: List<dynamic>.from(json["user_reports"].map((x) => x)),
        secureMedia: json["secure_media"] == null
            ? null
            : Media.fromJson(json["secure_media"]),
        isRedditMediaDomain: json["is_reddit_media_domain"],
        isMeta: json["is_meta"],
        category: json["category"],
        secureMediaEmbed: MediaEmbed.fromJson(json["secure_media_embed"]),
        linkFlairText: json["link_flair_text"],
        canModPost: json["can_mod_post"],
        score: json["score"],
        approvedBy: json["approved_by"],
        authorPremium: json["author_premium"],
        thumbnail: json["thumbnail"],
        edited: json["edited"],
        authorFlairCssClass: json["author_flair_css_class"] == null
            ? null
            : json["author_flair_css_class"],
        authorFlairRichtext: List<AuthorFlairRichtext>.from(
            json["author_flair_richtext"]
                .map((x) => AuthorFlairRichtext.fromJson(x))),
        gildings: Gildings.fromJson(json["gildings"]),
        contentCategories: json["content_categories"],
        isSelf: json["is_self"],
        modNote: json["mod_note"],
        created: json["created"],
        linkFlairType: authorFlairTypeValues.map[json["link_flair_type"]],
        wls: json["wls"],
        removedByCategory: json["removed_by_category"],
        bannedBy: json["banned_by"],
        authorFlairType: authorFlairTypeValues.map[json["author_flair_type"]],
        domain: domainValues.map[json["domain"]],
        allowLiveComments: json["allow_live_comments"],
        selftextHtml:
            json["selftext_html"] == null ? null : json["selftext_html"],
        likes: json["likes"],
        suggestedSort:
            json["suggested_sort"] == null ? null : json["suggested_sort"],
        bannedAtUtc: json["banned_at_utc"],
        viewCount: json["view_count"],
        archived: json["archived"],
        noFollow: json["no_follow"],
        isCrosspostable: json["is_crosspostable"],
        pinned: json["pinned"],
        over18: json["over_18"],
        allAwardings: List<AllAwarding>.from(
            json["all_awardings"].map((x) => AllAwarding.fromJson(x))),
        awarders: List<dynamic>.from(json["awarders"].map((x) => x)),
        mediaOnly: json["media_only"],
        linkFlairTemplateId: json["link_flair_template_id"] == null
            ? null
            : json["link_flair_template_id"],
        canGild: json["can_gild"],
        spoiler: json["spoiler"],
        locked: json["locked"],
        authorFlairText: json["author_flair_text"] == null
            ? null
            : json["author_flair_text"],
        treatmentTags: List<dynamic>.from(json["treatment_tags"].map((x) => x)),
        visited: json["visited"],
        removedBy: json["removed_by"],
        numReports: json["num_reports"],
        distinguished:
            json["distinguished"] == null ? null : json["distinguished"],
        subredditId: subredditIdValues.map[json["subreddit_id"]],
        modReasonBy: json["mod_reason_by"],
        removalReason: json["removal_reason"],
        linkFlairBackgroundColor: json["link_flair_background_color"],
        id: json["id"],
        isRobotIndexable: json["is_robot_indexable"],
        reportReasons: json["report_reasons"],
        author: json["author"],
        discussionType: json["discussion_type"],
        numComments: json["num_comments"],
        sendReplies: json["send_replies"],
        whitelistStatus: whitelistStatusValues.map[json["whitelist_status"]],
        contestMode: json["contest_mode"],
        modReports: List<dynamic>.from(json["mod_reports"].map((x) => x)),
        authorPatreonFlair: json["author_patreon_flair"],
        authorFlairTextColor: json["author_flair_text_color"] == null
            ? null
            : flairTextColorValues.map[json["author_flair_text_color"]],
        permalink: json["permalink"],
        parentWhitelistStatus:
            whitelistStatusValues.map[json["parent_whitelist_status"]],
        stickied: json["stickied"],
        url: json["url"],
        subredditSubscribers: json["subreddit_subscribers"],
        createdUtc: json["created_utc"],
        numCrossposts: json["num_crossposts"],
        media: json["media"] == null ? null : Media.fromJson(json["media"]),
        isVideo: json["is_video"],
        postHint: json["post_hint"] == null
            ? null
            : postHintValues.map[json["post_hint"]],
        preview:
            json["preview"] == null ? null : Preview.fromJson(json["preview"]),
      );

  Map<String, dynamic> toJson() => {
        "approved_at_utc": approvedAtUtc,
        "subreddit": subredditValues.reverse[subreddit],
        "selftext": selftext,
        "author_fullname": authorFullname,
        "saved": saved,
        "mod_reason_title": modReasonTitle,
        "gilded": gilded,
        "clicked": clicked,
        "title": title,
        "link_flair_richtext":
            List<dynamic>.from(linkFlairRichtext.map((x) => x.toJson())),
        "subreddit_name_prefixed":
            subredditNamePrefixedValues.reverse[subredditNamePrefixed],
        "hidden": hidden,
        "pwls": pwls,
        "link_flair_css_class": linkFlairCssClass,
        "downs": downs,
        "thumbnail_height": thumbnailHeight == null ? null : thumbnailHeight,
        "hide_score": hideScore,
        "name": name,
        "quarantine": quarantine,
        "link_flair_text_color":
            flairTextColorValues.reverse[linkFlairTextColor],
        "upvote_ratio": upvoteRatio,
        "author_flair_background_color": authorFlairBackgroundColor == null
            ? null
            : authorFlairBackgroundColor,
        "subreddit_type": subredditTypeValues.reverse[subredditType],
        "ups": ups,
        "total_awards_received": totalAwardsReceived,
        "media_embed": mediaEmbed.toJson(),
        "thumbnail_width": thumbnailWidth == null ? null : thumbnailWidth,
        "author_flair_template_id":
            authorFlairTemplateId == null ? null : authorFlairTemplateId,
        "is_original_content": isOriginalContent,
        "user_reports": List<dynamic>.from(userReports.map((x) => x)),
        "secure_media": secureMedia == null ? null : secureMedia.toJson(),
        "is_reddit_media_domain": isRedditMediaDomain,
        "is_meta": isMeta,
        "category": category,
        "secure_media_embed": secureMediaEmbed.toJson(),
        "link_flair_text": linkFlairText,
        "can_mod_post": canModPost,
        "score": score,
        "approved_by": approvedBy,
        "author_premium": authorPremium,
        "thumbnail": thumbnail,
        "edited": edited,
        "author_flair_css_class":
            authorFlairCssClass == null ? null : authorFlairCssClass,
        "author_flair_richtext":
            List<dynamic>.from(authorFlairRichtext.map((x) => x.toJson())),
        "gildings": gildings.toJson(),
        "content_categories": contentCategories,
        "is_self": isSelf,
        "mod_note": modNote,
        "created": created,
        "link_flair_type": authorFlairTypeValues.reverse[linkFlairType],
        "wls": wls,
        "removed_by_category": removedByCategory,
        "banned_by": bannedBy,
        "author_flair_type": authorFlairTypeValues.reverse[authorFlairType],
        "domain": domainValues.reverse[domain],
        "allow_live_comments": allowLiveComments,
        "selftext_html": selftextHtml == null ? null : selftextHtml,
        "likes": likes,
        "suggested_sort": suggestedSort == null ? null : suggestedSort,
        "banned_at_utc": bannedAtUtc,
        "view_count": viewCount,
        "archived": archived,
        "no_follow": noFollow,
        "is_crosspostable": isCrosspostable,
        "pinned": pinned,
        "over_18": over18,
        "all_awardings":
            List<dynamic>.from(allAwardings.map((x) => x.toJson())),
        "awarders": List<dynamic>.from(awarders.map((x) => x)),
        "media_only": mediaOnly,
        "link_flair_template_id":
            linkFlairTemplateId == null ? null : linkFlairTemplateId,
        "can_gild": canGild,
        "spoiler": spoiler,
        "locked": locked,
        "author_flair_text": authorFlairText == null ? null : authorFlairText,
        "treatment_tags": List<dynamic>.from(treatmentTags.map((x) => x)),
        "visited": visited,
        "removed_by": removedBy,
        "num_reports": numReports,
        "distinguished": distinguished == null ? null : distinguished,
        "subreddit_id": subredditIdValues.reverse[subredditId],
        "mod_reason_by": modReasonBy,
        "removal_reason": removalReason,
        "link_flair_background_color": linkFlairBackgroundColor,
        "id": id,
        "is_robot_indexable": isRobotIndexable,
        "report_reasons": reportReasons,
        "author": author,
        "discussion_type": discussionType,
        "num_comments": numComments,
        "send_replies": sendReplies,
        "whitelist_status": whitelistStatusValues.reverse[whitelistStatus],
        "contest_mode": contestMode,
        "mod_reports": List<dynamic>.from(modReports.map((x) => x)),
        "author_patreon_flair": authorPatreonFlair,
        "author_flair_text_color": authorFlairTextColor == null
            ? null
            : flairTextColorValues.reverse[authorFlairTextColor],
        "permalink": permalink,
        "parent_whitelist_status":
            whitelistStatusValues.reverse[parentWhitelistStatus],
        "stickied": stickied,
        "url": url,
        "subreddit_subscribers": subredditSubscribers,
        "created_utc": createdUtc,
        "num_crossposts": numCrossposts,
        "media": media == null ? null : media.toJson(),
        "is_video": isVideo,
        "post_hint": postHint == null ? null : postHintValues.reverse[postHint],
        "preview": preview == null ? null : preview.toJson(),
      };
}

class AllAwarding {
  dynamic giverCoinReward;
  dynamic subredditId;
  bool isNew;
  int daysOfDripExtension;
  int coinPrice;
  String id;
  dynamic pennyDonate;
  int coinReward;
  String iconUrl;
  int daysOfPremium;
  int iconHeight;
  List<ResizedIcon> resizedIcons;
  int iconWidth;
  dynamic startDate;
  bool isEnabled;
  String description;
  dynamic endDate;
  int subredditCoinReward;
  int count;
  String name;
  dynamic iconFormat;
  String awardSubType;
  dynamic pennyPrice;
  String awardType;

  AllAwarding({
    this.giverCoinReward,
    this.subredditId,
    this.isNew,
    this.daysOfDripExtension,
    this.coinPrice,
    this.id,
    this.pennyDonate,
    this.coinReward,
    this.iconUrl,
    this.daysOfPremium,
    this.iconHeight,
    this.resizedIcons,
    this.iconWidth,
    this.startDate,
    this.isEnabled,
    this.description,
    this.endDate,
    this.subredditCoinReward,
    this.count,
    this.name,
    this.iconFormat,
    this.awardSubType,
    this.pennyPrice,
    this.awardType,
  });

  factory AllAwarding.fromJson(Map<String, dynamic> json) => AllAwarding(
        giverCoinReward: json["giver_coin_reward"],
        subredditId: json["subreddit_id"],
        isNew: json["is_new"],
        daysOfDripExtension: json["days_of_drip_extension"],
        coinPrice: json["coin_price"],
        id: json["id"],
        pennyDonate: json["penny_donate"],
        coinReward: json["coin_reward"],
        iconUrl: json["icon_url"],
        daysOfPremium: json["days_of_premium"],
        iconHeight: json["icon_height"],
        resizedIcons: List<ResizedIcon>.from(
            json["resized_icons"].map((x) => ResizedIcon.fromJson(x))),
        iconWidth: json["icon_width"],
        startDate: json["start_date"],
        isEnabled: json["is_enabled"],
        description: json["description"],
        endDate: json["end_date"],
        subredditCoinReward: json["subreddit_coin_reward"],
        count: json["count"],
        name: json["name"],
        iconFormat: json["icon_format"],
        awardSubType: json["award_sub_type"],
        pennyPrice: json["penny_price"],
        awardType: json["award_type"],
      );

  Map<String, dynamic> toJson() => {
        "giver_coin_reward": giverCoinReward,
        "subreddit_id": subredditId,
        "is_new": isNew,
        "days_of_drip_extension": daysOfDripExtension,
        "coin_price": coinPrice,
        "id": id,
        "penny_donate": pennyDonate,
        "coin_reward": coinReward,
        "icon_url": iconUrl,
        "days_of_premium": daysOfPremium,
        "icon_height": iconHeight,
        "resized_icons":
            List<dynamic>.from(resizedIcons.map((x) => x.toJson())),
        "icon_width": iconWidth,
        "start_date": startDate,
        "is_enabled": isEnabled,
        "description": description,
        "end_date": endDate,
        "subreddit_coin_reward": subredditCoinReward,
        "count": count,
        "name": name,
        "icon_format": iconFormat,
        "award_sub_type": awardSubType,
        "penny_price": pennyPrice,
        "award_type": awardType,
      };
}

class ResizedIcon {
  String url;
  int width;
  int height;

  ResizedIcon({
    this.url,
    this.width,
    this.height,
  });

  factory ResizedIcon.fromJson(Map<String, dynamic> json) => ResizedIcon(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class AuthorFlairRichtext {
  String e;
  String t;
  String a;
  String u;

  AuthorFlairRichtext({
    this.e,
    this.t,
    this.a,
    this.u,
  });

  factory AuthorFlairRichtext.fromJson(Map<String, dynamic> json) =>
      AuthorFlairRichtext(
        e: json["e"],
        t: json["t"] == null ? null : json["t"],
        a: json["a"] == null ? null : json["a"],
        u: json["u"] == null ? null : json["u"],
      );

  Map<String, dynamic> toJson() => {
        "e": e,
        "t": t == null ? null : t,
        "a": a == null ? null : a,
        "u": u == null ? null : u,
      };
}

enum FlairTextColor { DARK }

final flairTextColorValues = EnumValues({"dark": FlairTextColor.DARK});

enum AuthorFlairType { RICHTEXT, TEXT }

final authorFlairTypeValues = EnumValues(
    {"richtext": AuthorFlairType.RICHTEXT, "text": AuthorFlairType.TEXT});

enum Domain { SELF_HEARTHSTONE, I_REDD_IT, V_REDD_IT, YOUTU_BE }

final domainValues = EnumValues({
  "i.redd.it": Domain.I_REDD_IT,
  "self.hearthstone": Domain.SELF_HEARTHSTONE,
  "v.redd.it": Domain.V_REDD_IT,
  "youtu.be": Domain.YOUTU_BE
});

class Gildings {
  int gid2;

  Gildings({
    this.gid2,
  });

  factory Gildings.fromJson(Map<String, dynamic> json) => Gildings(
        gid2: json["gid_2"] == null ? null : json["gid_2"],
      );

  Map<String, dynamic> toJson() => {
        "gid_2": gid2 == null ? null : gid2,
      };
}

class LinkFlairRichtext {
  AuthorFlairType e;
  String t;

  LinkFlairRichtext({
    this.e,
    this.t,
  });

  factory LinkFlairRichtext.fromJson(Map<String, dynamic> json) =>
      LinkFlairRichtext(
        e: authorFlairTypeValues.map[json["e"]],
        t: json["t"],
      );

  Map<String, dynamic> toJson() => {
        "e": authorFlairTypeValues.reverse[e],
        "t": t,
      };
}

class Media {
  RedditVideo redditVideo;
  Oembed oembed;
  String type;

  Media({
    this.redditVideo,
    this.oembed,
    this.type,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        redditVideo: json["reddit_video"] == null
            ? null
            : RedditVideo.fromJson(json["reddit_video"]),
        oembed: json["oembed"] == null ? null : Oembed.fromJson(json["oembed"]),
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "reddit_video": redditVideo == null ? null : redditVideo.toJson(),
        "oembed": oembed == null ? null : oembed.toJson(),
        "type": type == null ? null : type,
      };
}

class Oembed {
  String providerUrl;
  String title;
  String html;
  int thumbnailWidth;
  int height;
  int width;
  String version;
  String authorName;
  String providerName;
  String thumbnailUrl;
  String type;
  int thumbnailHeight;
  String authorUrl;

  Oembed({
    this.providerUrl,
    this.title,
    this.html,
    this.thumbnailWidth,
    this.height,
    this.width,
    this.version,
    this.authorName,
    this.providerName,
    this.thumbnailUrl,
    this.type,
    this.thumbnailHeight,
    this.authorUrl,
  });

  factory Oembed.fromJson(Map<String, dynamic> json) => Oembed(
        providerUrl: json["provider_url"],
        title: json["title"],
        html: json["html"],
        thumbnailWidth: json["thumbnail_width"],
        height: json["height"],
        width: json["width"],
        version: json["version"],
        authorName: json["author_name"],
        providerName: json["provider_name"],
        thumbnailUrl: json["thumbnail_url"],
        type: json["type"],
        thumbnailHeight: json["thumbnail_height"],
        authorUrl: json["author_url"],
      );

  Map<String, dynamic> toJson() => {
        "provider_url": providerUrl,
        "title": title,
        "html": html,
        "thumbnail_width": thumbnailWidth,
        "height": height,
        "width": width,
        "version": version,
        "author_name": authorName,
        "provider_name": providerName,
        "thumbnail_url": thumbnailUrl,
        "type": type,
        "thumbnail_height": thumbnailHeight,
        "author_url": authorUrl,
      };
}

class RedditVideo {
  String fallbackUrl;
  int height;
  int width;
  String scrubberMediaUrl;
  String dashUrl;
  int duration;
  String hlsUrl;
  bool isGif;
  String transcodingStatus;

  RedditVideo({
    this.fallbackUrl,
    this.height,
    this.width,
    this.scrubberMediaUrl,
    this.dashUrl,
    this.duration,
    this.hlsUrl,
    this.isGif,
    this.transcodingStatus,
  });

  factory RedditVideo.fromJson(Map<String, dynamic> json) => RedditVideo(
        fallbackUrl: json["fallback_url"],
        height: json["height"],
        width: json["width"],
        scrubberMediaUrl: json["scrubber_media_url"],
        dashUrl: json["dash_url"],
        duration: json["duration"],
        hlsUrl: json["hls_url"],
        isGif: json["is_gif"],
        transcodingStatus: json["transcoding_status"],
      );

  Map<String, dynamic> toJson() => {
        "fallback_url": fallbackUrl,
        "height": height,
        "width": width,
        "scrubber_media_url": scrubberMediaUrl,
        "dash_url": dashUrl,
        "duration": duration,
        "hls_url": hlsUrl,
        "is_gif": isGif,
        "transcoding_status": transcodingStatus,
      };
}

class MediaEmbed {
  String content;
  int width;
  bool scrolling;
  int height;
  String mediaDomainUrl;

  MediaEmbed({
    this.content,
    this.width,
    this.scrolling,
    this.height,
    this.mediaDomainUrl,
  });

  factory MediaEmbed.fromJson(Map<String, dynamic> json) => MediaEmbed(
        content: json["content"] == null ? null : json["content"],
        width: json["width"] == null ? null : json["width"],
        scrolling: json["scrolling"] == null ? null : json["scrolling"],
        height: json["height"] == null ? null : json["height"],
        mediaDomainUrl:
            json["media_domain_url"] == null ? null : json["media_domain_url"],
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? null : content,
        "width": width == null ? null : width,
        "scrolling": scrolling == null ? null : scrolling,
        "height": height == null ? null : height,
        "media_domain_url": mediaDomainUrl == null ? null : mediaDomainUrl,
      };
}

enum WhitelistStatus { ALL_ADS }

final whitelistStatusValues = EnumValues({"all_ads": WhitelistStatus.ALL_ADS});

enum PostHint { IMAGE, HOSTED_VIDEO, RICH_VIDEO }

final postHintValues = EnumValues({
  "hosted:video": PostHint.HOSTED_VIDEO,
  "image": PostHint.IMAGE,
  "rich:video": PostHint.RICH_VIDEO
});

class Preview {
  List<Image> images;
  bool enabled;

  Preview({
    this.images,
    this.enabled,
  });

  factory Preview.fromJson(Map<String, dynamic> json) => Preview(
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "enabled": enabled,
      };
}

class Image {
  ResizedIcon source;
  List<ResizedIcon> resolutions;
  Variants variants;
  String id;

  Image({
    this.source,
    this.resolutions,
    this.variants,
    this.id,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        source: ResizedIcon.fromJson(json["source"]),
        resolutions: List<ResizedIcon>.from(
            json["resolutions"].map((x) => ResizedIcon.fromJson(x))),
        variants: Variants.fromJson(json["variants"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "resolutions": List<dynamic>.from(resolutions.map((x) => x.toJson())),
        "variants": variants.toJson(),
        "id": id,
      };
}

class Variants {
  Variants();

  factory Variants.fromJson(Map<String, dynamic> json) => Variants();

  Map<String, dynamic> toJson() => {};
}

enum Subreddit { HEARTHSTONE }

final subredditValues = EnumValues({"hearthstone": Subreddit.HEARTHSTONE});

enum SubredditId { T5_2_W31_T }

final subredditIdValues = EnumValues({"t5_2w31t": SubredditId.T5_2_W31_T});

enum SubredditNamePrefixed { R_HEARTHSTONE }

final subredditNamePrefixedValues =
    EnumValues({"r/hearthstone": SubredditNamePrefixed.R_HEARTHSTONE});

enum SubredditType { PUBLIC }

final subredditTypeValues = EnumValues({"public": SubredditType.PUBLIC});

enum Kind { T3 }

final kindValues = EnumValues({"t3": Kind.T3});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
