
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/stateproviders/loading_state_provider.dart';

class LoadingSchoolWidget extends ConsumerStatefulWidget {
  const LoadingSchoolWidget({super.key});

  @override
  ConsumerState createState() => _LoadingSchoolWidgetState();
}

class _LoadingSchoolWidgetState extends ConsumerState<LoadingSchoolWidget> {
  @override
  Widget build(BuildContext context) {
    final loadingState=ref.read(loadingSchoolStateProvider);
    return const SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator());
  }
}
