import 'dart:convert';

import 'package:limonfy/app/data/models/link/link.model.dart';
import 'package:limonfy/app/data/datasources/local/interface/links/links.local.source.dart';
import 'package:limonfy/core/constants/limonfy.constants.dart';

class LinksLocalSourceImpl implements LinksLocalSource {
  @override
  Future<LinkModel> convertFromScript({required String link}) async {
    final l = LinkModel.fromJson(jsonDecode(link));
    const name = LimonfyConstants.limonfy;
    const icon = LimonfyConstants.urlIcon;
    return LinkModel(
      id: l.id,
      link: l.link,
      title: l.title.isEmpty ? name : l.title,
      description: l.description.isEmpty ? name : l.description,
      sourceName: l.sourceName.isEmpty ? name : l.sourceName,
      sourceImageUrl: l.sourceImageUrl.isEmpty ? icon : l.sourceImageUrl,
      imageUrl: l.imageUrl.isEmpty ? LimonfyConstants.urlBanner : l.imageUrl,
      private: l.private,
      linkSaveMethodId: l.linkSaveMethodId,
      userAccountId: l.userAccountId,
      updatedAt: l.updatedAt,
      createdAt: l.createdAt,
    );
  }
}
