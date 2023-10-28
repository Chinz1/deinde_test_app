import 'package:flutter/material.dart';

class BagdeWidget extends StatefulWidget {
  final String value;
  const BagdeWidget({super.key, required this.value});

  @override
  State<BagdeWidget> createState() => _BagdeWidgetState();
}

class _BagdeWidgetState extends State<BagdeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15, width: 15, decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(40)),
      child: Center(child: Text(widget.value ,
        style: Theme.of(context).textTheme.bodyLarge?.
        copyWith(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),),),
    );
  }
}
