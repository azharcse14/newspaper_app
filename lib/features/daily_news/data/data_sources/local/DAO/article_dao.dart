import 'package:floor/floor.dart';
import 'package:newspaper_app/features/daily_news/data/models/article.dart';

@dao
abstract class ArticleDao {

  // @insert
  // Future<void> insertAllArticle(List<ArticleModel> articles);

  @Insert()
  Future<void> insertArticle(ArticleModel article);
  
  @delete
  Future<void> deleteArticle(ArticleModel articleModel);
  
  @Query('SELECT * FROM article')
  Future<List<ArticleModel>> getArticles();
}