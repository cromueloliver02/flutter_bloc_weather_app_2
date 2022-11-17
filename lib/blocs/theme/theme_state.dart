part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final AppTheme appTheme;

  const ThemeState({required this.appTheme});

  factory ThemeState.initial() {
    return const ThemeState(appTheme: AppTheme.light);
  }

  @override
  List<Object> get props => [appTheme];

  @override
  String toString() => 'ThemeState(appTheme: $appTheme)';

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}

enum AppTheme { light, dark }
