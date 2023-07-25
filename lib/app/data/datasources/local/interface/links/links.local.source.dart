import 'package:limonfy/app/data/models/link/link.model.dart';

abstract class LinksLocalSource {
  Future<LinkModel> convertFromScript({required String link});
}
