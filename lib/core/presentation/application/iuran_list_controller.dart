import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_all_iuran.dart';

class IuranListController extends GetxController {
  final ListenAllIuran listenAllIuran;

  IuranListController({
    required this.listenAllIuran,
  });

  late String title;
  late List<String?> slugs;
  List<Iuran> allIuran = [];
  RxList<IuranFilter> filters = RxList();

  StreamSubscription<Either<AppError, List<Iuran>>>?
      _listenAllIuranSubscription;

  @override
  void onInit() {
    final Map<String, dynamic> additionalData = Get.arguments;
    slugs = additionalData['slugs'] ?? <String?>[];

    ever(filters, (List<IuranFilter> filters) {
      final categoryTitle = filters
              .firstWhere(
                (e) => e.type == IuranFilterType.category,
                orElse: () => IuranFilter(),
              )
              .title ??
          "";

      title = categoryTitle.isEmpty ? "Semua Iuran" : "Iuran $categoryTitle";

      listenIncomingData();
    });

    final initialFilters = slugs
        .map(
          (slug) => Constants.iuranFilters.firstWhere(
            (f) => f.slug == slug,
            orElse: () => IuranFilter(),
          ),
        )
        .toList();

    filters.value = initialFilters;

    super.onInit();
  }

  void listenIncomingData() {
    _listenAllIuranSubscription?.cancel();
    _listenAllIuranSubscription = listenAllIuran(
      filters: filters,
    ).listen(
      (either) => either.fold(
        (error) {
          allIuran = [];
          update();
        },
        (list) {
          allIuran = list;
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
