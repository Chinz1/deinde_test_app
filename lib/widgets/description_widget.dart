import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;
  const DescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
        Container(
          height: 5, width: 5, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
        ),
          const SizedBox(width: 15,),
          Text(description, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xff4F4F4F), fontWeight: FontWeight.w400, fontSize: 14),)
      ],),
    );
  }
}
