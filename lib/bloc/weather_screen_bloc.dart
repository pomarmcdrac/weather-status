import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


// Events
class WeatherScreenEvent extends Equatable {
  @override
  List<Object> get props => null;
}

class GetWeatherValue extends WeatherScreenEvent {

}

class GetPlacesValue extends WeatherScreenEvent {

}

class ResetWeatherValue extends WeatherScreenEvent {

}

// States
class WeatherScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingWeatherScreen extends WeatherScreenState {
  LoadingWeatherScreen();
}

class ShowWeatherValue extends WeatherScreenState {
  final List weatherValue;
  ShowWeatherValue(this.weatherValue);
}

// BLoC
class DashboardScreenBLoC extends Bloc<WeatherScreenEvent, WeatherScreenState> {
  List weather
}