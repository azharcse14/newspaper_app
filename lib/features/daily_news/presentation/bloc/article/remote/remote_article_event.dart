import '../../../../domain/entities/article.dart';

abstract class RemoteArticlesEvent {
  const RemoteArticlesEvent();
  @override
  List<Object> get props => [];
}

class GetArticles extends RemoteArticlesEvent {
  const GetArticles();
}

class SaveAllArticle extends RemoteArticlesEvent {
  const SaveAllArticle(List<ArticleEntity> article) ;
}