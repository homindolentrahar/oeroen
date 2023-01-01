import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/core/presentation/application/base_controller.dart';

class StateHandleWidget extends StatelessWidget {
  const StateHandleWidget({
    super.key,
    required this.status,
    this.child,
    this.loadingView,
    this.emptyView,
  });

  final ControllerStatus status;
  final Widget? child;
  final Widget? loadingView;
  final Widget? emptyView;

  @override
  Widget build(BuildContext context) {
    Logger().i("Status: $status");

    if (status == ControllerStatus.initial) {
      return const SizedBox.shrink();
    } else if (status == ControllerStatus.loading) {
      return loadingView ?? const _DefaultLoadingWidget();
    } else if (status == ControllerStatus.success) {
      return child ?? Container();
    } else if (status == ControllerStatus.error) {
      return Container();
    } else if (status == ControllerStatus.empty) {
      return emptyView ?? Container();
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _DefaultLoadingWidget extends StatelessWidget {
  const _DefaultLoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class _DefaultEmptyWidget extends StatelessWidget {
  const _DefaultEmptyWidget();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
