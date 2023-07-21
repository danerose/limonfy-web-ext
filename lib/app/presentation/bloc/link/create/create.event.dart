import 'package:equatable/equatable.dart';
import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';

abstract class CreateLinkEvent extends Equatable {
  const CreateLinkEvent();
  @override
  List<Object?> get props => [];
}

class CreateLinkOnInit extends CreateLinkEvent {
  const CreateLinkOnInit();
}

class CreateLinkMakePrivate extends CreateLinkEvent {
  const CreateLinkMakePrivate({required this.private});
  final bool private;
}

class CreateLinkSubmitLink extends CreateLinkEvent {
  const CreateLinkSubmitLink({required this.coll});
  final LinkCollection coll;
}
