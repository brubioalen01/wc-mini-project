import 'package:wcminiproj/core/utils/api_response.dart';
import 'package:wcminiproj/core/utils/usecase.dart';
import 'package:wcminiproj/features/rickyandmorty/data/models/paginated_characters_model.dart';
import 'package:wcminiproj/features/rickyandmorty/domain/repository/rickyandmorty_repository.dart';

class GetAllCharactersUseCase
    implements UseCase<ApiResponse<PaginatedCharactersModel>, void> {
  final RickyandmortyRepository repository;

  GetAllCharactersUseCase(this.repository);

  @override
  Future<ApiResponse<PaginatedCharactersModel>> call({void params}) {
    return repository.getAllCharacters();
  }
}
