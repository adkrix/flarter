part of 'osm_bloc.dart';

class OsmState {}

class InitialOsmState extends OsmState {}

class LoadedOsmState extends OsmState {
  final List<Osm> osmList;

  LoadedOsmState({required this.osmList});
}

class LoadingOsmState extends OsmState {}
