import '../models/osm.dart';

abstract class AbstractDataRepo {
  Future<List<Osm>> getItems([String? q]);
}
