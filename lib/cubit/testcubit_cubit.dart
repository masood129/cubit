import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'testcubit_state.dart';

class TestcubitCubit extends Cubit<TestcubitEvent> {
  TestcubitCubit() : super(TestCubitInitial());

  Future<void> login() async {
    emit(LoadingScreen());
    Future.delayed(Duration(seconds: 2), () {
      emit(CheckLoginCubit(login: true));
    });
  }

  Future<void> logout() async {
    emit(LoadingScreen());
    Future.delayed(Duration(seconds: 2), () {
      emit(CheckLoginCubit(login: false));
    });
  }

}
