import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/widget/base_state.dart';

import '../../generated/l10n.dart';

class ErrorLoad extends StatefulWidget {
  ErrorLoad({super.key, required this.onRetry, this.errorText});

  VoidCallback onRetry;
  String? errorText;

  @override
  State<ErrorLoad> createState() => _ErrorLoadState();
}

class _ErrorLoadState extends ABaseState<ErrorLoad> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.errorText == null || widget.errorText!.isEmpty) {
      widget.errorText = S.of(context).errorLoadData;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.errorText!,
            style: theme.textTheme.labelMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: widget.onRetry,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Hicons.refresh_1_bold,
                    color: Color(0xff9456F9),
                  ),
                  Text(
                    S.of(context).retryLoad,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelMedium,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
