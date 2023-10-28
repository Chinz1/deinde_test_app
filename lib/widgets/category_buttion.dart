import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final Widget? icon;
  final String? title;
  const CategoryButton({super.key, this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15,),
        Container(
          height: 38, width: 38,
          decoration: BoxDecoration(color: const Color(0xffEFEFF0), borderRadius: BorderRadius.circular(8)),
          child: Center(child: icon,),
        ),
        const SizedBox(height: 5,),
        Text(title ?? "", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black45, fontSize: 12),)
      ],
    );
  }
}

class CategoryButtonModel{
  final Widget icon;
  final String buttonTitle;
  CategoryButtonModel(this.icon, this.buttonTitle);
}
