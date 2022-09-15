part of 'app_state_bloc.dart';

enum Status { loading, showPicker, connected }


@immutable
abstract class AppStateState extends Equatable {}


class AppStateInitial extends AppStateState {
  final Status status;
  final Map<String, dynamic> heroes;

  AppStateInitial({
    this.status = Status.loading, 
    required this.heroes
  });

  // factory AppStateInitial.initialState() => AppStateInitial( heroes: const <String, dynamic>{} ); 
  @override
  // TODO: implement props
  List<Object?> get props => [status, heroes];
}
