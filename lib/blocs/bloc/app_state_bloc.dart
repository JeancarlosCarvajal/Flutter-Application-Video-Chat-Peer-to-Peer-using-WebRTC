import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppStateState> {
  AppStateBloc() : super(AppStateInitial(heroes: const <String, dynamic>{})) {
 
    on<AppStateEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ShowPickerEvent>((event, emit) {
      // event.heroes;
    });

    on<LoadingEvent>((event, emit) {
      // event.heroes;
    });

  }
}
