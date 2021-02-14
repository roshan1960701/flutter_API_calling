// To parse this JSON data, do
//
//     final getCategory = getCategoryFromJson(jsonString);

import 'dart:convert';

///Request
//HTTP Request
///
///
///
GetCategoryRequest getCategoryRequestFromJson(String str) =>
    GetCategoryRequest.fromJson(json.decode(str));

String getCategoryRequestToJson(GetCategoryRequest data) =>
    json.encode(data.toJson());

class GetCategoryRequest {
  GetCategoryRequest({
    this.action,
    this.userid,
  });

  String action;
  String userid;

  factory GetCategoryRequest.fromJson(Map<String, dynamic> json) =>
      GetCategoryRequest(
        action: json["action"] == null ? null : json["action"],
        userid: json["userid"] == null ? null : json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "action": action == null ? null : action,
        "userid": userid == null ? null : userid,
      };
}

//Response
///HTTP Response
///
///

// To parse this JSON data, do
//
//     final getCategoryResponse = getCategoryResponseFromJson(jsonString);

GetCategoryResponse getCategoryResponseFromJson(String str) =>
    GetCategoryResponse.fromJson(json.decode(str));

String getCategoryResponseToJson(GetCategoryResponse data) =>
    json.encode(data.toJson());

class GetCategoryResponse {
  GetCategoryResponse({
    this.message,
    this.issuccessful,
    this.banners,
    this.categorycontent,
  });

  String message;
  bool issuccessful;
  List<Banner> banners;
  List<Categorycontent> categorycontent;

  factory GetCategoryResponse.fromJson(Map<String, dynamic> json) =>
      GetCategoryResponse(
        message: json["message"] == null ? null : json["message"],
        issuccessful:
            json["issuccessful"] == null ? null : json["issuccessful"],
        banners: json["banners"] == null
            ? null
            : List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        categorycontent: json["categorycontent"] == null
            ? null
            : List<Categorycontent>.from(json["categorycontent"]
                .map((x) => Categorycontent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "issuccessful": issuccessful == null ? null : issuccessful,
        "banners": banners == null
            ? null
            : List<dynamic>.from(banners.map((x) => x.toJson())),
        "categorycontent": categorycontent == null
            ? null
            : List<dynamic>.from(categorycontent.map((x) => x.toJson())),
      };
}

class Banner {
  Banner({
    this.type,
    this.bimage,
    this.btitle,
    this.data,
  });

  int type;
  String bimage;
  String btitle;
  Data data;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        type: json["type"] == null ? null : json["type"],
        bimage: json["bimage"] == null ? null : json["bimage"],
        btitle: json["btitle"] == null ? null : json["btitle"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "bimage": bimage == null ? null : bimage,
        "btitle": btitle == null ? null : btitle,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.title,
    this.image,
    this.id,
    this.shortdesc,
    this.audiolink,
    this.catids,
    this.isfav,
    this.ispremium,
    this.type,
  });

  String title;
  String image;
  String id;
  String shortdesc;
  String audiolink;
  List<String> catids;
  int isfav;
  int ispremium;
  int type;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        id: json["id"] == null ? null : json["id"],
        shortdesc: json["shortdesc"] == null ? null : json["shortdesc"],
        audiolink: json["audiolink"] == null ? null : json["audiolink"],
        catids: json["catids"] == null
            ? null
            : List<String>.from(json["catids"].map((x) => x)),
        isfav: json["isfav"] == null ? null : json["isfav"],
        ispremium: json["ispremium"] == null ? null : json["ispremium"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "id": id == null ? null : id,
        "shortdesc": shortdesc == null ? null : shortdesc,
        "audiolink": audiolink == null ? null : audiolink,
        "catids":
            catids == null ? null : List<dynamic>.from(catids.map((x) => x)),
        "isfav": isfav == null ? null : isfav,
        "ispremium": ispremium == null ? null : ispremium,
        "type": type == null ? null : type,
      };
}

class Categorycontent {
  Categorycontent({
    this.name,
    this.id,
    this.image,
    this.thumbnailsize,
    this.content,
  });

  String name;
  String id;
  String image;
  String thumbnailsize;
  List<Data> content;

  factory Categorycontent.fromJson(Map<String, dynamic> json) =>
      Categorycontent(
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
        thumbnailsize:
            json["thumbnailsize"] == null ? null : json["thumbnailsize"],
        content: json["content"] == null
            ? null
            : List<Data>.from(json["content"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "image": image == null ? null : image,
        "thumbnailsize": thumbnailsize == null ? null : thumbnailsize,
        "content": content == null
            ? null
            : List<dynamic>.from(content.map((x) => x.toJson())),
      };
}
