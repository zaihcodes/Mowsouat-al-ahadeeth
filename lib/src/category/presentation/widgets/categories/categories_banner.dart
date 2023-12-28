import 'package:flutter/material.dart';

class CategoriesBanner extends StatelessWidget {
  const CategoriesBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 250,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'موسوعة',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'الأحاديث النبوية',
                style: TextStyle(fontSize: 35),
              ),
            ]),
      ),
    );
  }
}
