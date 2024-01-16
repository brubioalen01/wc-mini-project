import 'package:dio/dio.dart';
import 'package:wcminiproj/core/constants/constants.dart';
import 'package:wcminiproj/core/utils/api_response.dart';
import 'package:wcminiproj/features/rickyandmorty/data/models/paginated_characters_model.dart';

class RickyandmortyApiService {
  final dio = Dio();
  Future<ApiResponse<PaginatedCharactersModel>> getAllCharacters() async {
    final response = await dio.get('$baseUrl/character');
    if (response.statusCode == 200) {
      final formattedValue = PaginatedCharactersModel.fromJson(response.data);
      return ApiResponse<PaginatedCharactersModel>(data: formattedValue);
    }
    return ApiResponse<PaginatedCharactersModel>(error: true);
  }
}
