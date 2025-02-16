import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Importación necesaria para la localización en español e inglés
import 'features/welcome/screens/welcome_screen.dart';
import 'features/chat/providers/chat_thread_provider.dart';
import 'features/chat/providers/chat_provider.dart';
import 'features/chat/services/chat_service.dart';
import 'features/home/screens/home_screen.dart';
import 'features/chat/screens/chattray_screen.dart';
import 'features/profile/screens/profile_screen.dart';
import 'features/calendar/screens/calendar_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Proveedores para la funcionalidad de chat
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
        // Establece el idioma de la aplicación en español.
        locale: const Locale('es', 'ES'), // Aquí se configura el idioma predeterminado de la app como español (España).
        
        // Definición de los idiomas soportados por la aplicación.
        supportedLocales: [
          const Locale('en', 'US'), // Soporta inglés (Estados Unidos).
          const Locale('es', 'ES'), // Soporta español (España).
        ],
        
        // Delegados de localización necesarios para traducir los textos de la aplicación.
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate, // Traducción de componentes de Material Design (botones, diálogos, etc).
          GlobalWidgetsLocalizations.delegate, // Traducción de componentes de widgets generales (texto, controles).
        ],
        
        // Aquí se define la ruta inicial y las demás rutas de la aplicación.
        initialRoute: '/', // La primera pantalla que se cargará será la WelcomeScreen.
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/home': (context) => const HomeScreen(),
          '/calendar': (context) => const CalendarScreen(),
          '/chat': (context) => const ChatTrayScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
