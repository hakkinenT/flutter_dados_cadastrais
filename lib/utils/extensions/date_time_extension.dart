// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String asDayMonthYear() {
    return DateFormat('dd/MM/yyyy', 'pt_BR').format(this);
  }
}
