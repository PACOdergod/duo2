import 'package:bloc/bloc.dart';
import 'package:duo2/src/quiz/quiz_botones.dart';
import 'package:duo2/src/services/lesson_service.dart';
import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final List<String> options;
  QuizCubit(this.options) : super(QuizInitial(options));
}
