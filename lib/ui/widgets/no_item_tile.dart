import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';

class NoItemTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      child: Center(
        child: ListTile(
          horizontalTitleGap: 30,
          title: Text(
            AppStrings.noProducts,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
