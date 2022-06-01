// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

CatsModel newsModelFromJson(String str) => CatsModel.fromJson(json.decode(str));

String newsModelToJson(CatsModel data) => json.encode(data.toJson());

class CatsModel {
    CatsModel({
        this.status,
        this.id,
        this.user,
        this.text,
        this.v,
        this.source,
        this.updatedAt,
        this.type,
        this.createdAt,
        this.deleted,
        this.used,
    });

    Status? status;
    String? id;
    String? user;
    String? text;
    int? v;
    String? source;
    DateTime? updatedAt;
    String? type;
    DateTime? createdAt;
    bool? deleted;
    bool? used;
    factory CatsModel.fromJson(Map<String, dynamic> json) => CatsModel(
        status: Status.fromJson(json["status"]),
        id: json["_id"],
        user: json["user"],
        text: json["text"],
        v: json["__v"],
        source: json["source"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        type: json["type"],
        createdAt: DateTime.parse(json["createdAt"]),
        deleted: json["deleted"],
        used: json["used"],
    );

    Map<String, dynamic> toJson() => {
        "status": status!.toJson(),
        "_id": id,
        "user": user,
        "text": text,
        "__v": v,
        "source": source,
        "updatedAt": updatedAt.toString(),
        "type": type,
        "createdAt": createdAt.toString(),
        "deleted": deleted,
        "used": used,
    };
}

class Status {
    Status({
        this.verified,
        this.sentCount,
    });

    bool? verified;
    int? sentCount;

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        verified: json["verified"],
        sentCount: json["sentCount"],
    );

    Map<String, dynamic> toJson() => {
        "verified": verified,
        "sentCount": sentCount,
    };
}
