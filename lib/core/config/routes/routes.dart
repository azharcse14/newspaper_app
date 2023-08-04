import 'package:flutter/material.dart';
import 'package:newspaper_app/features/daily_news/domain/entities/article.dart';
import 'package:newspaper_app/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:newspaper_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:newspaper_app/features/daily_news/presentation/pages/saved_article/saved_article.dart';
import 'package:newspaper_app/features/user/presentation/pages/credential/login_page.dart';

import '../../../features/daily_news/presentation/pages/home/transit_screen.dart';
import '../../../features/user/presentation/pages/credential/sign_up_page.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute( DailyNews());

      case '/ArticleDetails':
        return _materialRoute(ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());

        case '/LoginPage':
        return _materialRoute(const LoginPage());

        case '/SignUpPage':
        return _materialRoute(const SignUpPage());

        case '/TransitScreen':
        return _materialRoute(const TransitScreen());
        
      default:
        return _materialRoute( DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
