import 'package:wcminiproj/core/utils/api_response.dart';
import 'package:wcminiproj/features/rickyandmorty/data/data_sources/remote/rickyandmorty_api_service.dart';
import 'package:wcminiproj/features/rickyandmorty/data/models/paginated_characters_model.dart';
import 'package:wcminiproj/features/rickyandmorty/domain/repository/rickyandmorty_repository.dart';

class RickyandmortyRepositoryImpl implements RickyandmortyRepository {
  final RickyandmortyApiService rickyandmortyApiService;

  RickyandmortyRepositoryImpl(this.rickyandmortyApiService);

  @override
  Future<ApiResponse<PaginatedCharactersModel>> getAllCharacters(int? page) {
    return rickyandmortyApiService.getAllCharacters(page);
  }
}
