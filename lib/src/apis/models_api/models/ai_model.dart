import 'package:easy_openai/src/apis/models_api/models/ai_model_permission.dart';

class AIModel {
  AIModel({
    required this.id,
    required this.object,
    required this.created,
    required this.ownedBy,
    required this.permission,
    required this.root,
    this.parent,
  });

  String id;
  String object;
  int created;
  String ownedBy;
  List<AIModelPermission> permission;
  String root;
  dynamic parent;

  factory AIModel.fromJson(Map<String, dynamic> json) => AIModel(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        ownedBy: json["owned_by"],
        permission: List<AIModelPermission>.from(
            json["permission"].map((x) => AIModelPermission.fromJson(x))),
        root: json["root"],
        parent: json["parent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "owned_by": ownedBy,
        "permission": List<dynamic>.from(permission.map((x) => x.toJson())),
        "root": root,
        "parent": parent,
      };
}
