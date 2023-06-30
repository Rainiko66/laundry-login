//import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry/common/common.dart';
//import 'package:laundry/common/loading_page.dart';
import 'package:laundry/features/auth/controller/auth_controller.dart';
//import 'package:laundry/features/auth/view/login_view.dart';
import 'package:laundry/features/auth/view/signup_view.dart';
//import 'package:laundry/features/home/view/home_view.dart';
import 'package:laundry/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';



void main() {
  runApp(const ProviderScope(child:  MyApp(),
  ));
}
 

const String deepLinkURL = 'https://laundry.nyuad.com';

void launchDeepLink() async {
  final String url = '$deepLinkURL';

    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    const String playStoreUrl = 'https://play.google.com/apps/internaltest/4701533395587299533';

    // ignore: deprecated_member_use
    if (await canLaunch(playStoreUrl)) {
      // ignore: deprecated_member_use
      await launch(playStoreUrl);
    } else {
      throw 'Could not launch $playStoreUrl';
    }
  }
}



class MyApp extends ConsumerWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LAUNDRY',
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(data: (user) {


        //if(user!=null) {
          //return const HomeView();
       // }


        return const SignUpView();


      },
     
      error: (error, st) => ErrorPage(error: error.toString(),),
      loading: () => const LoadingPage(),
      ),
    );
  }
}
