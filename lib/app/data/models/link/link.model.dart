import 'package:equatable/equatable.dart';
import 'package:html/dom.dart' as htmldom;
import 'package:limonfy/core/constants/limonfy.constants.dart';
import 'package:limonfy/core/utils/html.util.dart';

import 'package:limonfy/core/utils/validators.util.dart';
import 'package:limonfy/app/domain/entities/link/link.entity.dart';

class LinkModel extends Equatable {
  final String id;
  final String link;
  final String title;
  final String description;
  final String sourceName;
  final String sourceImageUrl;
  final String imageUrl;
  final bool private;
  final String linkSaveMethodId;
  final String userAccountId;
  final String updatedAt;
  final String createdAt;

  const LinkModel({
    required this.id,
    required this.link,
    required this.title,
    required this.description,
    required this.sourceName,
    required this.sourceImageUrl,
    required this.imageUrl,
    required this.private,
    required this.linkSaveMethodId,
    required this.userAccountId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory LinkModel.fromJson(Map<String, dynamic>? json) {
    return LinkModel(
      id: ValidatorUtils.containsKey(json, '_id', ''),
      link: ValidatorUtils.containsKey(json, 'link', ''),
      title:
          ValidatorUtils.containsKey(json, 'title', LimonfyConstants.limonfy),
      description: ValidatorUtils.containsKey(
        json,
        'description',
        LimonfyConstants.limonfy,
      ),
      sourceName: ValidatorUtils.containsKey(
        json,
        'source_name',
        LimonfyConstants.limonfy,
      ),
      sourceImageUrl: ValidatorUtils.containsKey(
        json,
        'source_image_url',
        LimonfyConstants.urlIcon,
      ),
      imageUrl: ValidatorUtils.containsKey(
        json,
        'image_url',
        LimonfyConstants.urlBanner,
      ),
      private: ValidatorUtils.containsKey(json, 'private', false),
      linkSaveMethodId: ValidatorUtils.containsKey(
        json,
        'link_save_method_id',
        '',
      ),
      userAccountId: ValidatorUtils.containsKey(json, 'user_account_id', ''),
      updatedAt: ValidatorUtils.containsKey(json, 'updated_at', ''),
      createdAt: ValidatorUtils.containsKey(json, 'created_at', ''),
    );
  }

  factory LinkModel.fromMetaTags({
    required String url,
    required htmldom.Element? head,
    required List<htmldom.Element> metas,
  }) {
    return LinkModel(
      id: '',
      link: url,
      title: HtmlUtils.getTitle(head),
      description: HtmlUtils.getDescription(url, head, metas),
      sourceName: HtmlUtils.getSiteName(head, url),
      sourceImageUrl: HtmlUtils.getFavIco(head),
      imageUrl: HtmlUtils.getImage(head),
      private: false,
      linkSaveMethodId: '',
      userAccountId: '',
      updatedAt: '',
      createdAt: '',
    );
  }

  Link toEntity() {
    return Link(
      id: id,
      link: link,
      title: title,
      description: description,
      sourceName: sourceName,
      sourceImageUrl: sourceImageUrl,
      imageUrl: imageUrl,
      private: private,
      linkSaveMethodId: linkSaveMethodId,
      userAccountId: userAccountId,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        link,
        title,
        description,
        sourceName,
        sourceImageUrl,
        imageUrl,
        private,
        linkSaveMethodId,
        userAccountId,
        updatedAt,
        createdAt,
      ];
}
