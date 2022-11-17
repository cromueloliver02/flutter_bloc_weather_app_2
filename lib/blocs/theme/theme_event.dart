part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class SetThemeEvent extends ThemeEvent {
  final double temperature;

  const SetThemeEvent({required this.temperature});

  @override
  List<Object> get props => [temperature];
}
