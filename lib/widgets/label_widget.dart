import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String widgetKey;
  final String widgetValue;
  const LabelWidget({super.key, required this.widgetKey, required this.widgetValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widgetKey, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
        const SizedBox(width: 8,),
        Text(widgetValue,  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),),
      ],
    );
  }
}
