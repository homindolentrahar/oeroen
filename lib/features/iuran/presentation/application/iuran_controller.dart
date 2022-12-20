import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_active_iuran.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_transaction_iuran.dart';

class IuranController extends GetxController {
  final ListenActiveIuran listenActiveIuran;
  final ListenTransactionIuran listenTransactionIuran;

  IuranController({
    required this.listenActiveIuran,
    required this.listenTransactionIuran,
  });

  int iuranMenuIndex = 0;
  List<Iuran> transactionIuran = [];
  List<Iuran> activeIuran = [];
  RxList<IuranFilter> filters = RxList();
  StreamSubscription<Either<AppError, List<Iuran>>>?
      _listenActiveIuranSubscription;
  StreamSubscription<Either<AppError, List<Iuran>>>?
      _listenTransactionIuranSubscription;

  @override
  void onInit() {
    ever(filters, (List<IuranFilter> filters) {
      listenIncomingData();
    });

    listenIncomingData();
    super.onInit();
  }

  void listenIncomingData() {
    _listenTransactionIuranSubscription?.cancel();
    _listenActiveIuranSubscription?.cancel();
    _listenTransactionIuranSubscription =
        listenTransactionIuran(filters: filters).listen(
      (either) => either.fold(
        (error) {
          transactionIuran = [];
          update();
        },
        (list) {
          transactionIuran = list;
          update();
        },
      ),
    );
    _listenActiveIuranSubscription = listenActiveIuran(filters: filters).listen(
      (either) => either.fold(
        (error) {
          activeIuran = [];
          update();
        },
        (list) {
          activeIuran = list;
          update();
        },
      ),
    );
  }

  void iuranMenuChanged(int index) {
    iuranMenuIndex = index;
    update();
  }

  void setFilters(List<IuranFilter> value) {
    filters.value = value;
  }

  void removeFilter(IuranFilter value) {
    filters.remove(value);
  }
}
