import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/providers/auth_provider.dart';
import 'package:tokosepatu/providers/cart_provider.dart';
import 'package:tokosepatu/providers/page_provider.dart';
import 'package:tokosepatu/providers/product_provider.dart';
import 'package:tokosepatu/providers/transaction_provider.dart';
import 'package:tokosepatu/providers/wishlist_provider.dart';
import 'package:tokosepatu/screens/cart_screen.dart';
import 'package:tokosepatu/screens/checkout_screen.dart';
import 'package:tokosepatu/screens/checkout_success_screen.dart';
import 'package:tokosepatu/screens/edit_profile_screen.dart';
import 'package:tokosepatu/screens/home/main_screen.dart';
import 'package:tokosepatu/screens/sign_in_screen.dart';
import 'package:tokosepatu/screens/sign_up_screen.dart';
import 'package:tokosepatu/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/sign-in': (context) => SignInScreen(),
          '/sign-up': (context) => SignUpScreen(),
          '/home': (context) => MainScreen(),
          '/edit-profile': (context) => EditProfileScreen(),
          '/cart': (context) => CartScreen(),
          '/checkout': (context) => CheckoutScreen(),
          '/checkout-success': (context) => CheckoutSuccessScreen(),
        },
      ),
    );
  }
}
