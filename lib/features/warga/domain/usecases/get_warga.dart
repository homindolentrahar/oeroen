import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/core/domain/models/warga.dart';
import 'package:oeroen/features/warga/domain/repositories/i_warga_repository.dart';
import 'package:oeroen/utils/helper/secure_storage_helper.dart';

class GetWarga {
  final IWargaRepository _repository;

  GetWarga(this._repository);

  Future<Either<AppError, Warga>> call() async {
    final String wargaId =
        await SecureStorageHelper.instance.getUserCredential();
    return _repository.getWarga(wargaId);
  }
}
