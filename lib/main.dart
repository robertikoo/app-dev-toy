import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/welcome/screens/welcome_screen.dart';
import 'features/chat/providers/chat_thread_provider.dart';
import 'features/chat/providers/chat_provider.dart';
import 'features/chat/services/chat_service.dart';
import 'features/home/screens/home_screen.dart';
import 'features/chat/screens/chattray_screen.dart';
import 'features/profile/screens/profile_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ChatService>(
          create: (_) => ChatServiceImpl(),
        ),
        ChangeNotifierProxyProvider<ChatService, ChatProvider>(
          create: (context) => ChatProvider(context.read<ChatService>()),
          update: (context, chatService, previous) => 
            previous ?? ChatProvider(chatService),
        ),
        ChangeNotifierProxyProvider<ChatService, ChatThreadProvider>(
          create: (context) => ChatThreadProvider(context.read<ChatService>()),
          update: (context, chatService, previous) => 
            previous ?? ChatThreadProvider(chatService),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/home': (context) => const HomeScreen(),
          '/chat': (context) => const ChatTrayScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );

  }
}