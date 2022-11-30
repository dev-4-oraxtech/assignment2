import 'package:flutter/material.dart';
import '../../consts/app_colors_strings.dart';
import '../../../../view/screens/addnews/add_news.dart';
import '../../../../utils/routes/routes_name.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.pushNamed(context,RoutesName.addNews);
        },
        child: Container(
          height: 45,
          width: 45,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.yellowishGradient,
          ),
          child: const Icon(
            Icons.add,
            size: 25,
          ),
          
        ),
      ),
    );
  }
}