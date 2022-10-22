
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChipsWithContainer extends StatefulWidget {
  const ChipsWithContainer({Key? key,required this. callback}) : super(key: key);

  final void Function(String) callback ;

  @override
  State<ChipsWithContainer> createState() => _ChipsWithContainerState(callback:callback );
}

class _ChipsWithContainerState extends State<ChipsWithContainer> {

  _ChipsWithContainerState({required this. callback}) ;
  final void Function(String) callback ;

  final List<String> options = [ "bitcoin", "india" , "cricket" , "football" , "china" , "japan"   ] ;

  int tag = 1;

  @override
  Widget build(BuildContext context) {
      return ChipsChoice<int>.single(
      value: tag,
      onChanged: (val) => setState(() {
        tag = val ;
        callback(options[val]) ;
      }),
      choiceItems: C2Choice.listFrom<int, String>(
        source: options,
        value: (i, v) {
          return i ;
        },
        label: (i, v) => v,
      ),
    );
  }
}






