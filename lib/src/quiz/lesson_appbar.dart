import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:duo2/src/progress_bar/progress_bar.dart';
import 'package:duo2/src/services/lesson_service.dart';

class LessonAppbar extends StatelessWidget {
  const LessonAppbar({
    Key? key,
    required this.tam,
  }) : super(key: key);

  final int tam;

  @override
  Widget build(BuildContext context) {

    var lessonService = Provider.of<LessonService>(context);
    var index = lessonService.currentIndex;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: Colors.white,
        child: Row(
          children: [

            IconButton(
              icon: Icon(Icons.close, size: 32,),
              onPressed: ()=> Navigator.pop(context),
            ),

            ProgressBar(
              largo: tam,
              index: index,
              ancho: MediaQuery.of(context).size.width*.65,
            ),

          ],
        ),
      ),
    );
  }
}