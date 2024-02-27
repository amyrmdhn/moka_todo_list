import 'package:riverpod/riverpod.dart';

class DateNotifier extends StateNotifier<DateTime?> {
  DateNotifier() : super(null);

  void selectedDate(DateTime pickedDate) {
    state = pickedDate;
  }
}

final dateProvider = StateNotifierProvider<DateNotifier, DateTime?>(
  (ref) => DateNotifier(),
);
