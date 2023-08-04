import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user/presentation/cubit/auth/auth_cubit.dart';
import '../../../../user/presentation/pages/credential/login_page.dart';
import '../saved_article/saved_article.dart';

class TransitScreen extends StatelessWidget {
  const TransitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(
      builder: (context,authState){

        if (authState is Authenticated){
          return const SavedArticles();
        }else{
          return LoginPage();
        }
      },
    );
  }
}
