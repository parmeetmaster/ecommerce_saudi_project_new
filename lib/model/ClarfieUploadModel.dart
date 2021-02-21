// To parse this JSON data, do
//
//     final clarfieUploadModel = clarfieUploadModelFromJson(jsonString);

import 'dart:convert';

ClarfieUploadModel clarfieUploadModelFromJson(String str) => ClarfieUploadModel.fromJson(json.decode(str));

String clarfieUploadModelToJson(ClarfieUploadModel data) => json.encode(data.toJson());

class ClarfieUploadModel {
  ClarfieUploadModel({
    this.inputs,
  });

  List<Input> inputs;

  factory ClarfieUploadModel.fromJson(Map<String, dynamic> json) => ClarfieUploadModel(
    inputs: List<Input>.from(json["inputs"].map((x) => Input.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "inputs": List<dynamic>.from(inputs.map((x) => x.toJson())),
  };
}

class Input {
  Input({
    this.data,
  });

  Data data;

  factory Input.fromJson(Map<String, dynamic> json) => Input(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.image,
  });

  Image image;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "image": image.toJson(),
  };
}

class Image {
  Image({
    this.base64,
  });

  String base64;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    base64: json["base64"],
  );

  Map<String, dynamic> toJson() => {
    "base64": base64,
  };
}
