import 'package:dbtech_tdd_clean_archecture_bloc/resources/images.dart';
import 'package:equatable/equatable.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.image,
    required this.title,
    required this.descrption,
  });
  const PageContent.first()
      : this(
          image: MediaRes.casualReading,
          title: 'Brand new curriculum',
          descrption: 'This is the first online education platform designed'
              " by the world's top professors",
        );
  const PageContent.second()
      : this(
          image: MediaRes.casualLife,
          title: 'Brand a fun atmosphere',
          descrption: 'This is the first online education platform designed'
              " by the world's top professors",
        );
  const PageContent.third()
      : this(
          image: MediaRes.casualMeditation,
          title: 'Easy to join the lesson',
          descrption: 'This is the first online education platform designed'
              " by the world's top professors",
        );

  final String image;
  final String title;
  final String descrption;

  @override
  List<Object> get props => [image, title, descrption];
}
