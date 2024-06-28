import 'package:expiration_date/core/enums/enums.dart';

class OutputState {
  const OutputState({
    required this.blocStatus,
    this.errorText,
  });

  final BlocStatus blocStatus;
  final String? errorText;

  OutputState copyWith({
    required BlocStatus blocStatus,
    String? errorText,
  }) {
    return OutputState(
      blocStatus: blocStatus,
      errorText: errorText,
    );
  }
}