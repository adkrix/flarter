import 'package:flarter/repos/abstract_data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
part 'osm_state.dart';
part 'osm_events.dart';

class OsmBloc extends Bloc<OsmEvent, OsmState> {
  final AbstractDataRepo _dataRepo;

  OsmBloc(this._dataRepo) : super(InitialOsmState()) {
    on<LoadOsmList>((event, emit) async {
      final osmList = await _dataRepo.getItems();
      emit(LoadedOsmState(osmList: osmList));
    });
    on<LoadedOsmList>((event, emit) {
      print('LoadedOsmList');
    });
  }
}
