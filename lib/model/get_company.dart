// To parse this JSON data, do
//
//     final getCompany = getCompanyFromJson(jsonString);

import 'dart:convert';

List<GetCompany> getCompanyFromJson(String str) =>
    List<GetCompany>.from(json.decode(str).map((x) => GetCompany.fromJson(x)));

String getCompanyToJson(List<GetCompany> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCompany {
  GetCompany({
    this.data,
    this.returnMsg,
    this.statusCode,
  });

  List<Datum>? data;
  String? returnMsg;
  int? statusCode;

  factory GetCompany.fromJson(Map<String, dynamic> json) => GetCompany(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        returnMsg: json["returnMsg"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "returnMsg": returnMsg,
        "statusCode": statusCode,
      };
}

class Datum {
  Datum({
    this.companyId,
    this.companyName,
  });

  int? companyId;
  String? companyName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        companyId: json["companyId"],
        companyName: json["companyName"],
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "companyName": companyName,
      };
}
