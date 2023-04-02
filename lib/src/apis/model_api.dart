import 'package:easy_openai/src/apis/api.dart';
import 'package:easy_openai/src/models/model_api/ai_model.dart';

class ModelAPI extends OpenAIAPI {
  Future<List<AIModel>> all() async {
    final response = await get('/models');

    final list =
        response.data['data'] is List ? response.data['data'] as List : [];

    return List<AIModel>.from(list.map((json) => AIModel.fromJson(json)));
  }

  Future<AIModel> model({
    required String id,
  }) async {
    final response = await get('/models/$id');

    final json = response.data is Map
        ? response.data as Map<String, dynamic>
        : <String, dynamic>{};

    return AIModel.fromJson(json);
  }
}
