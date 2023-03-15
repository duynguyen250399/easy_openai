class AIModelPermission {
  AIModelPermission({
    required this.id,
    required this.object,
    required this.created,
    required this.allowCreateEngine,
    required this.allowSampling,
    required this.allowLogprobs,
    required this.allowSearchIndices,
    required this.allowView,
    required this.allowFineTuning,
    required this.organization,
    this.group,
    required this.isBlocking,
  });

  String id;
  String object;
  int created;
  bool allowCreateEngine;
  bool allowSampling;
  bool allowLogprobs;
  bool allowSearchIndices;
  bool allowView;
  bool allowFineTuning;
  String organization;
  dynamic group;
  bool isBlocking;

  factory AIModelPermission.fromJson(Map<String, dynamic> json) =>
      AIModelPermission(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        allowCreateEngine: json["allow_create_engine"],
        allowSampling: json["allow_sampling"],
        allowLogprobs: json["allow_logprobs"],
        allowSearchIndices: json["allow_search_indices"],
        allowView: json["allow_view"],
        allowFineTuning: json["allow_fine_tuning"],
        organization: json["organization"],
        group: json["group"],
        isBlocking: json["is_blocking"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "allow_create_engine": allowCreateEngine,
        "allow_sampling": allowSampling,
        "allow_logprobs": allowLogprobs,
        "allow_search_indices": allowSearchIndices,
        "allow_view": allowView,
        "allow_fine_tuning": allowFineTuning,
        "organization": organization,
        "group": group,
        "is_blocking": isBlocking,
      };
}
