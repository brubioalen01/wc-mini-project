import 'package:wcminiproj/core/utils/api_response.dart';
import 'package:wcminiproj/features/rickyandmorty/data/models/paginated_characters_model.dart';

abstract class RickyandmortyRepository {
  Future<ApiResponse<PaginatedCharactersModel>> getAllCharacters();
}
