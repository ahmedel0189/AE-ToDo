import 'package:bloc/bloc.dart';

part 'todo_cubit_state.dart';

class TodoCubitCubit extends Cubit<TodoCubitState> {
  TodoCubitCubit() : super(TodoCubitInitial());
}
