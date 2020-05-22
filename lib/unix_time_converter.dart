import 'package:intl/intl.dart';

int timeInMillis = 1586348737122;
var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
var formattedDate = DateFormat.yMMMd().format(date);
