import 'package:easy_openai/src/apis/base_api.dart';
import 'package:easy_openai/src/apis/models_api/models/ai_model.dart';

export 'api.dart';
export 'models/ai_model.dart';
export 'models/ai_model_permission.dart';

class ModelsApi extends BaseApi {
  Future<List<AIModel>> all({
    int version = 1,
  }) async {
    final response = await client.get('/$version/models');

    final list =
        response.data['data'] is List ? response.data['data'] as List : [];

    return List<AIModel>.from(list.map((json) => AIModel.fromJson(json)));
  }

  Future<AIModel> get({
    int version = 1,
    required String id,
  }) async {
    final response = await client.get('/$version/models/$id');

    final json = response.data is Map
        ? response.data as Map<String, dynamic>
        : <String, dynamic>{};

    return AIModel.fromJson(json);
  }
}
