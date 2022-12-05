import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_paid_iuran.dart';

class RecentTransactionController extends GetxController {
  final ListenPaidIuran listenPaidIuran;

  RecentTransactionController({
    required this.listenPaidIuran,
  });

  List<Iuran> paidIuran = [];
  List<IuranFilter> filters = [];
  StreamSubscription<Either<AppError, List<Iuran>>>?
      _listenPaidIuranSubscription;

  @override
  void onInit() {
    listenIncomingData();
    super.onInit();
  }

  void listenIncomingData() {
    Logger().w("Filters: ${filters.map((e) => e.slug).toList()}");
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
    filters = value;
    listenIncomingData();
    // update();
  }

  void removeFilter(IuranFilter value) {
    filters.remove(value);
    listenIncomingData();
    update();
  }
}
