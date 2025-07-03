import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppSecrets {
  // Use environment variables with fallbacks
  static String get supabaseUrl {
    // Priority: .env file -> --dart-define -> empty string
    return dotenv.env['SUPABASE_URL'] ??
        const String.fromEnvironment('SUPABASE_URL', defaultValue: '');
  }

  static String get supabaseAnonKey {
    // Priority: .env file -> --dart-define -> empty string
    return dotenv.env['SUPABASE_ANON_KEY'] ??
        const String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: '');
  }

  // Validate that secrets are properly configured
  static bool get isConfigured {
    return supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty;
  }

  // Get Supabase client instance (following Supabase docs pattern)
  static String get url => supabaseUrl;
  static String get anonKey => supabaseAnonKey;
}
