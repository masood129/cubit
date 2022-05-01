part of 'testcubit_cubit.dart';

@immutable
abstract class TestcubitEvent {
}
class TestCubitInitial extends TestcubitEvent {}
class CheckLoginCubit extends TestcubitEvent {
  bool? login;

  CheckLoginCubit({this.login});
}
// class DecreaseCubit extends TestcubitEvent {}
class LoadingScreen extends TestcubitEvent {
}
// class IncreaseinCubit extends TestcubitEvent {}
