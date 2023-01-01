import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_transaction_iuran.dart';

class RecentTransactionController extends GetxController {
  final ListenTransactionIuran listenPaidIuran;

  RecentTransactionController({
    required this.listenPaidIuran,
  });

  List<Iuran> paidIuran = [];
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
    _listenPaidIuranSubscription = listenPaidIuran(
      filters: filters,
    ).listen(
      (either) => either.fold(
        (error) {
          paidIuran = [];
          update();
        },
        (list) {
          paidIuran = list;
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
