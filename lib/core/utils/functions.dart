import 'package:intl/intl.dart';

String enumValueToString(Object? enumValue) =>
    enumValue.toString().split(".").last;

T convertStringToEnum<T>(Iterable<T> values, String? value) =>
    values.firstWhere(
      (type) => enumValueToString(type) == value,
      orElse: () =>
          throw Exception("$value is not part of ${values.first.runtimeType}"),
    );

String convertDateToReadable(DateTime timestamp) {
  return DateFormat('E dd MMM yyyy HH:mm \'GMT\'').format(timestamp);
}
