// To parse this JSON data, do
//
//     final helpCenter = helpCenterFromJson(jsonString);

import 'dart:convert';

HelpCenterModel helpCenterModelFromJson(String str) =>
    HelpCenterModel.fromJson(json.decode(str));

String helpCenterModelToJson(HelpCenterModel data) =>
    json.encode(data.toJson());

class HelpCenterModel {
  HelpCenterModel({
    this.data,
  });

  var data;

  factory HelpCenterModel.fromJson(Map<String, dynamic> json) =>
      HelpCenterModel(
        data:
            List<Response>.from(json["data"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.key,
    this.label,
    this.value,
    this.show,
    this.icon,
    this.subQuestion,
  });

  var key;
  var label;
  var value;
  var show;
  var icon;
  var subQuestion;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        key: json["key"],
        label: json["label"],
        value: json["value"],
        show: json["show"],
        icon: json["icon"],
        subQuestion: json["subQuestion"] == null
            ? null
            : List<SubQuestion>.from(
                json["subQuestion"].map((x) => SubQuestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "label": label,
        "value": value,
        "show": show,
        "icon": icon,
        "subQuestion": subQuestion == null
            ? null
            : List<dynamic>.from(subQuestion.map((x) => x.toJson())),
      };
}

class SubQuestion {
  SubQuestion({
    this.label,
    this.value,
    this.answer,
    this.form,
    this.empcode,
    this.phone,
    this.description,
    this.attachment,
    this.furtherSubQuestion,
    this.empCode,
  });

  var label;
  var value;
  var answer;
  var form;
  var empcode;
  var phone;
  var description;
  var attachment;
  var furtherSubQuestion;
  var empCode;

  factory SubQuestion.fromJson(Map<String, dynamic> json) => SubQuestion(
        label: json["label"],
        value: json["value"],
        answer: json["answer"],
        form: json["form"],
        empcode: json["empcode"] == null ? null : json["empcode"],
        phone: json["phone"],
        description: json["description"],
        attachment: json["attachment"],
        furtherSubQuestion: json["furtherSubQuestion"] == null
            ? null
            : List<FurtherSubQuestion>.from(json["furtherSubQuestion"]
                .map((x) => FurtherSubQuestion.fromJson(x))),
        empCode: json["empCode"] == null ? null : json["empCode"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
        "answer": answer,
        "form": form,
        "empcode": empcode == null ? null : empcode,
        "phone": phone,
        "description": description,
        "attachment": attachment,
        "furtherSubQuestion": furtherSubQuestion == null
            ? null
            : List<dynamic>.from(furtherSubQuestion.map((x) => x.toJson())),
        "empCode": empCode == null ? null : empCode,
      };
}

class FurtherSubQuestion {
  FurtherSubQuestion({
    this.label,
    this.value,
    this.answer,
    this.form,
    this.empcode,
    this.phone,
    this.description,
    this.attachment,
  });

  var label;
  var value;
  var answer;
  var form;
  var empcode;
  var phone;
  var description;
  var attachment;

  factory FurtherSubQuestion.fromJson(Map<String, dynamic> json) =>
      FurtherSubQuestion(
        label: json["label"],
        value: json["value"],
        answer: json["answer"],
        form: json["form"],
        empcode: json["empcode"],
        phone: json["phone"],
        description: json["description"],
        attachment: json["attachment"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
        "answer": answer,
        "form": form,
        "empcode": empcode,
        "phone": phone,
        "description": description,
        "attachment": attachment,
      };
}
