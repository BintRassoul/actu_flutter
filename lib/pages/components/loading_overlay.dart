import 'package:flutter/material.dart';

import '../../widgets/customized_progress_indicator.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingOverlay(this.isLoading, {required this.child});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return custumizedProgressIndicator();
    }
    return child;
  }
}
