import 'package:bloc/bloc.dart';
import 'package:duo2/src/quiz/quiz_botones.dart';
import 'package:meta/meta.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final List<String> options;
  QuizCubit(this.options) : super(QuizInitial(options));
}
