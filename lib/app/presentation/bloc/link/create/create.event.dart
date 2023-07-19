import 'package:equatable/equatable.dart';
import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';
import 'package:limonfy/app/domain/entities/link/link.entity.dart';

abstract class CreateLinkEvent extends Equatable {
  const CreateLinkEvent();
  @override
  List<Object?> get props => [];
}

class CreateLinkOnInit extends CreateLinkEvent {
  const CreateLinkOnInit({required this.coll});
  final LinkCollection coll;
}

class CreateLinkOnCollSelect extends CreateLinkEvent {
  const CreateLinkOnCollSelect({required this.coll});
  final LinkCollection coll;
}

class CreateLinkGetMetaTagsFromLink extends CreateLinkEvent {
  const CreateLinkGetMetaTagsFromLink({required this.url});
  final String url;
}

class CreateLinkMakePrivate extends CreateLinkEvent {
  const CreateLinkMakePrivate({required this.private});
  final bool private;
}

class CreateLinkSubmitLink extends CreateLinkEvent {
  const CreateLinkSubmitLink({required this.link});
  final Link link;
}

class CreateLinkSetUrl extends CreateLinkEvent {
  const CreateLinkSetUrl({required this.url});
  final String url;
}
