import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/desa/domain/usecases/listen_transaction_desa.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';

class DesaTransactionController extends GetxController {
  final ListenTransactionDesa listenTransactionDesa;

  DesaTransactionController({
    required this.listenTransactionDesa,
  });

  List<Iuran> transactionDesa = [];
  RxList<IuranFilter> filters = RxList();
  StreamSubscription<Either<AppError, List<Iuran>>>?
      _listenPaidIuranSubscription;

  @override
  void onInit() {
    ever(filters, (List<IuranFilter> filters) {
      listenIncomingData();
    });

    listenIncomingData();
    super.onInit();
  }

  void listenIncomingData() {
    _listenPaidIuranSubscription?.cancel();
    _listenPaidIuranSubscription = listenTransactionDesa(
      filters: filters,
    ).listen(
      (either) => either.fold(
        (error) {
          transactionDesa = [];
          update();
        },
        (list) {
          transactionDesa = list;
          update();
        },
      ),
    );
  }

  void setFilters(List<IuranFilter> value) {
    filters.value = value;
  }

  void removeFilter(IuranFilter value) {
    filters.remove(value);
  }
}
