part of 'app_state_bloc.dart';

@immutable
class AppStateEvent extends Equatable {

  final List _props;
 
  const AppStateEvent([this._props = const []]);
  @override 
  List<Object?> get props => _props; 
}


class LoadingEvent extends AppStateEvent {

}



class ShowPickerEvent extends AppStateEvent {
  final Map<String, dynamic> heroes;

  ShowPickerEvent(this.heroes): super([heroes]); // super para enviarla a la clase padre
}