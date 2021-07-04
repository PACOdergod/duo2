
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  LessonCubit() : super( LessonInit() );

  
}