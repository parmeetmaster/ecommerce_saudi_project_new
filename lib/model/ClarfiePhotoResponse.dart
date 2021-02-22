// To parse this JSON data, do
//
//     final clarfiePhotoResponse = clarfiePhotoResponseFromJson(jsonString);

import 'dart:convert';

ClarfiePhotoResponse clarfiePhotoResponseFromJson(String str) => ClarfiePhotoResponse.fromJson(json.decode(str));

String clarfiePhotoResponseToJson(ClarfiePhotoResponse data) => json.encode(data.toJson());

class ClarfiePhotoResponse {
  ClarfiePhotoResponse({
    this.status,
    this.outputs,
  });

  ClarfiePhotoResponseStatus status;
  List<Output> outputs;

  factory ClarfiePhotoResponse.fromJson(Map<String, dynamic> json) => ClarfiePhotoResponse(
    status: ClarfiePhotoResponseStatus.fromJson(json["status"]),
    outputs: List<Output>.from(json["outputs"].map((x) => Output.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status.toJson(),
    "outputs": List<dynamic>.from(outputs.map((x) => x.toJson())),
  };
}

class Output {
  Output({
    this.id,
    this.status,
    this.createdAt,
    this.model,
    this.input,
    this.data,
  });

  String id;
  ModelVersionStatus status;
  DateTime createdAt;
  Model model;
  Input input;
  OutputData data;

  factory Output.fromJson(Map<String, dynamic> json) => Output(
    id: json["id"],
    status: ModelVersionStatus.fromJson(json["status"]),
    createdAt: DateTime.parse(json["created_at"]),
    model: Model.fromJson(json["model"]),
    input: Input.fromJson(json["input"]),
    data: OutputData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status.toJson(),
    "created_at": createdAt.toIso8601String(),
    "model": model.toJson(),
    "input": input.toJson(),
    "data": data.toJson(),
  };
}

class OutputData {
  OutputData({
    this.regions,
  });

  List<Region> regions;

  factory OutputData.fromJson(Map<String, dynamic> json) => OutputData(
    regions: List<Region>.from(json["regions"].map((x) => Region.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "regions": List<dynamic>.from(regions.map((x) => x.toJson())),
  };
}

class Region {
  Region({
    this.id,
    this.regionInfo,
    this.data,
    this.value,
  });

  String id;
  RegionInfo regionInfo;
  RegionData data;
  double value;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["id"],
    regionInfo: RegionInfo.fromJson(json["region_info"]),
    data: RegionData.fromJson(json["data"]),
    value: json["value"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "region_info": regionInfo.toJson(),
    "data": data.toJson(),
    "value": value,
  };
}

class RegionData {
  RegionData({
    this.concepts,
  });

  List<Concept> concepts;

  factory RegionData.fromJson(Map<String, dynamic> json) => RegionData(
    concepts: List<Concept>.from(json["concepts"].map((x) => Concept.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "concepts": List<dynamic>.from(concepts.map((x) => x.toJson())),
  };
}

class Concept {
  Concept({
    this.id,
    this.name,
    this.value,
    this.appId,
  });

  String id;
  String name;
  double value;
  String appId;

  factory Concept.fromJson(Map<String, dynamic> json) => Concept(
    id: json["id"],
    name: json["name"],
    value: json["value"].toDouble(),
    appId: json["app_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "value": value,
    "app_id": appId,
  };
}

class RegionInfo {
  RegionInfo({
    this.boundingBox,
  });

  BoundingBox boundingBox;

  factory RegionInfo.fromJson(Map<String, dynamic> json) => RegionInfo(
    boundingBox: BoundingBox.fromJson(json["bounding_box"]),
  );

  Map<String, dynamic> toJson() => {
    "bounding_box": boundingBox.toJson(),
  };
}

class BoundingBox {
  BoundingBox({
    this.topRow,
    this.leftCol,
    this.bottomRow,
    this.rightCol,
  });

  double topRow;
  double leftCol;
  double bottomRow;
  double rightCol;

  factory BoundingBox.fromJson(Map<String, dynamic> json) => BoundingBox(
    topRow: json["top_row"].toDouble(),
    leftCol: json["left_col"].toDouble(),
    bottomRow: json["bottom_row"].toDouble(),
    rightCol: json["right_col"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "top_row": topRow,
    "left_col": leftCol,
    "bottom_row": bottomRow,
    "right_col": rightCol,
  };
}

class Input {
  Input({
    this.id,
    this.data,
  });

  String id;
  InputData data;

  factory Input.fromJson(Map<String, dynamic> json) => Input(
    id: json["id"],
    data: InputData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data": data.toJson(),
  };
}

class InputData {
  InputData({
    this.image,
  });

  Image image;

  factory InputData.fromJson(Map<String, dynamic> json) => InputData(
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "image": image.toJson(),
  };
}

class Image {
  Image({
    this.url,
    this.base64,
  });

  String url;
  String base64;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
    base64: json["base64"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "base64": base64,
  };
}

class Model {
  Model({
    this.id,
    this.name,
    this.createdAt,
    this.appId,
    this.outputInfo,
    this.modelVersion,
    this.displayName,
    this.inputInfo,
    this.trainInfo,
    this.modelTypeId,
  });

  String id;
  String name;
  DateTime createdAt;
  String appId;
  OutputInfo outputInfo;
  ModelVersion modelVersion;
  String displayName;
  InputInfo inputInfo;
  TrainInfo trainInfo;
  String modelTypeId;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    appId: json["app_id"],
    outputInfo: OutputInfo.fromJson(json["output_info"]),
    modelVersion: ModelVersion.fromJson(json["model_version"]),
    displayName: json["display_name"],
    inputInfo: InputInfo.fromJson(json["input_info"]),
    trainInfo: TrainInfo.fromJson(json["train_info"]),
    modelTypeId: json["model_type_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "app_id": appId,
    "output_info": outputInfo.toJson(),
    "model_version": modelVersion.toJson(),
    "display_name": displayName,
    "input_info": inputInfo.toJson(),
    "train_info": trainInfo.toJson(),
    "model_type_id": modelTypeId,
  };
}

class InputInfo {
  InputInfo({
    this.fieldsMap,
  });

  InputInfoFieldsMap fieldsMap;

  factory InputInfo.fromJson(Map<String, dynamic> json) => InputInfo(
    fieldsMap: InputInfoFieldsMap.fromJson(json["fields_map"]),
  );

  Map<String, dynamic> toJson() => {
    "fields_map": fieldsMap.toJson(),
  };
}

class InputInfoFieldsMap {
  InputInfoFieldsMap({
    this.image,
  });

  String image;

  factory InputInfoFieldsMap.fromJson(Map<String, dynamic> json) => InputInfoFieldsMap(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}

class ModelVersion {
  ModelVersion({
    this.id,
    this.createdAt,
    this.status,
  });

  String id;
  DateTime createdAt;
  ModelVersionStatus status;

  factory ModelVersion.fromJson(Map<String, dynamic> json) => ModelVersion(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    status: ModelVersionStatus.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "status": status.toJson(),
  };
}

class ModelVersionStatus {
  ModelVersionStatus({
    this.code,
    this.description,
  });

  int code;
  String description;

  factory ModelVersionStatus.fromJson(Map<String, dynamic> json) => ModelVersionStatus(
    code: json["code"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "description": description,
  };
}

class OutputInfo {
  OutputInfo({
    this.outputConfig,
    this.message,
    this.type,
    this.typeExt,
    this.fieldsMap,
    this.params,
  });

  OutputConfig outputConfig;
  String message;
  String type;
  String typeExt;
  OutputInfoFieldsMap fieldsMap;
  OutputInfoParams params;

  factory OutputInfo.fromJson(Map<String, dynamic> json) => OutputInfo(
    outputConfig: OutputConfig.fromJson(json["output_config"]),
    message: json["message"],
    type: json["type"],
    typeExt: json["type_ext"],
    fieldsMap: OutputInfoFieldsMap.fromJson(json["fields_map"]),
    params: OutputInfoParams.fromJson(json["params"]),
  );

  Map<String, dynamic> toJson() => {
    "output_config": outputConfig.toJson(),
    "message": message,
    "type": type,
    "type_ext": typeExt,
    "fields_map": fieldsMap.toJson(),
    "params": params.toJson(),
  };
}

class OutputInfoFieldsMap {
  OutputInfoFieldsMap({
    this.regionsDataConceptsId,
    this.regionsDataConceptsValue,
    this.regionsRegionInfoBoundingBox,
  });

  String regionsDataConceptsId;
  String regionsDataConceptsValue;
  String regionsRegionInfoBoundingBox;

  factory OutputInfoFieldsMap.fromJson(Map<String, dynamic> json) => OutputInfoFieldsMap(
    regionsDataConceptsId: json["regions[...].data.concepts[...].id"],
    regionsDataConceptsValue: json["regions[...].data.concepts[...].value"],
    regionsRegionInfoBoundingBox: json["regions[...].region_info.bounding_box"],
  );

  Map<String, dynamic> toJson() => {
    "regions[...].data.concepts[...].id": regionsDataConceptsId,
    "regions[...].data.concepts[...].value": regionsDataConceptsValue,
    "regions[...].region_info.bounding_box": regionsRegionInfoBoundingBox,
  };
}

class OutputConfig {
  OutputConfig({
    this.conceptsMutuallyExclusive,
    this.closedEnvironment,
    this.maxConcepts,
    this.minValue,
  });

  bool conceptsMutuallyExclusive;
  bool closedEnvironment;
  int maxConcepts;
  int minValue;

  factory OutputConfig.fromJson(Map<String, dynamic> json) => OutputConfig(
    conceptsMutuallyExclusive: json["concepts_mutually_exclusive"],
    closedEnvironment: json["closed_environment"],
    maxConcepts: json["max_concepts"],
    minValue: json["min_value"],
  );

  Map<String, dynamic> toJson() => {
    "concepts_mutually_exclusive": conceptsMutuallyExclusive,
    "closed_environment": closedEnvironment,
    "max_concepts": maxConcepts,
    "min_value": minValue,
  };
}

class OutputInfoParams {
  OutputInfoParams({
    this.detectionThreshold,
  });

  double detectionThreshold;

  factory OutputInfoParams.fromJson(Map<String, dynamic> json) => OutputInfoParams(
    detectionThreshold: json["detection_threshold"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "detection_threshold": detectionThreshold,
  };
}

class TrainInfo {
  TrainInfo({
    this.params,
  });

  TrainInfoParams params;

  factory TrainInfo.fromJson(Map<String, dynamic> json) => TrainInfo(
    params: TrainInfoParams.fromJson(json["params"]),
  );

  Map<String, dynamic> toJson() => {
    "params": params.toJson(),
  };
}

class TrainInfoParams {
  TrainInfoParams({
    this.testSplitPercent,
  });

  int testSplitPercent;

  factory TrainInfoParams.fromJson(Map<String, dynamic> json) => TrainInfoParams(
    testSplitPercent: json["test_split_percent"],
  );

  Map<String, dynamic> toJson() => {
    "test_split_percent": testSplitPercent,
  };
}

class ClarfiePhotoResponseStatus {
  ClarfiePhotoResponseStatus({
    this.code,
    this.description,
    this.reqId,
  });

  int code;
  String description;
  String reqId;

  factory ClarfiePhotoResponseStatus.fromJson(Map<String, dynamic> json) => ClarfiePhotoResponseStatus(
    code: json["code"],
    description: json["description"],
    reqId: json["req_id"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "description": description,
    "req_id": reqId,
  };
}
