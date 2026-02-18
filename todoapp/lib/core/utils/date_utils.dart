import 'package:intl/intl.dart';

// format a date to a readable string
String formateDate(DateTime date) {
  return DateFormat('MMM dd yyy').format(date);
}

// calculate days left until a date
int daysUntil(DateTime date) {
  return date.difference(DateTime.now()).inDays;
}

// check if a date is overdue
bool isOverdue(DateTime date) {
  return date.isBefore(DateTime.now());
}

// compare two dates (for sorting)
int compareDates(DateTime a, DateTime b) {
  return a.compareTo(b);
}



