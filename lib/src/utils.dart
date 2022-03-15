import 'package:intl/intl.dart';

T? firstOrNull<T>(Iterable<T> iterable) {
  try {
    return iterable.first;
  } on StateError catch (_) {
    return null;
  }
}

DateTime? parseDateString(String? dateString) {
  if (dateString == null) {
    return null;
  }
  DateFormat format = DateFormat("EEE, dd MMM yyyy hh:mm:ss zzz");
  return format.parse(dateString, true);
}
