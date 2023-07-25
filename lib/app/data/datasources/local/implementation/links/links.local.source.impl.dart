import 'dart:convert';

import 'package:limonfy/app/data/models/link/link.model.dart';
import 'package:limonfy/app/data/datasources/local/interface/links/links.local.source.dart';

class LinksLocalSourceImpl implements LinksLocalSource {
  @override
  Future<LinkModel> convertFromScript({required String link}) async {
    return LinkModel.fromJson(jsonDecode(link));
  }
}
