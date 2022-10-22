import 'package:intl/intl.dart';

String convertedDateTime( DateTime now ) {
  var formatter =  DateFormat()  ;
  return formatter.add_yMMMd().add_Hm().format(now) ;
}