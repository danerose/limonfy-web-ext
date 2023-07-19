import 'package:equatable/equatable.dart';
import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';

abstract class FeatCollecEvent extends Equatable {
  const FeatCollecEvent();

  @override
  List<Object?> get props => [];
}

class FeatCollecInit extends FeatCollecEvent {
  const FeatCollecInit({required this.refresh});
  final bool refresh;
}

class FeatCollecSetReoder extends FeatCollecEvent {
  const FeatCollecSetReoder({required this.list});
  final List<LinkCollection> list;
}
