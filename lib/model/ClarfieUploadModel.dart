// To parse this JSON data, do
//
//     final clarfieBase64Model = clarfieBase64ModelFromJson(jsonString);

import 'dart:convert';

ClarfieBase64Model clarfieBase64ModelFromJson(String str) => ClarfieBase64Model.fromJson(json.decode(str));

String clarfieBase64ModelToJson(ClarfieBase64Model data) => json.encode(data.toJson());

class ClarfieBase64Model {
  ClarfieBase64Model({
    this.inputs,
  });

  List<Input1> inputs;

  factory ClarfieBase64Model.fromJson(Map<String, dynamic> json) => ClarfieBase64Model(
    inputs: List<Input1>.from(json["inputs"].map((x) => Input1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "inputs": List<dynamic>.from(inputs.map((x) => x.toJson())),
  };
}

class Input1 {
  Input1({
    this.data,
  });

  Data data;

  factory Input1.fromJson(Map<String, dynamic> json) => Input1(
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

  Image1 image;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    image: Image1.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "image": image.toJson(),
  };
}

class Image1 {
  Image1({
    this.base64,
  });

  String base64;

  factory Image1.fromJson(Map<String, dynamic> json) => Image1(
    base64: json["base64"],
  );

  Map<String, dynamic> toJson() => {
    "base64": base64,
  };
}
