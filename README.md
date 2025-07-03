# blog_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

### Environment Setup

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Configure environment variables:**
   - Copy `env.example` to `.env`
   - Fill in your Supabase credentials:
     ```
     SUPABASE_URL=your_supabase_url_here
     SUPABASE_ANON_KEY=your_supabase_anon_key_here
     ```

3. **Run the app:**
   ```bash
   flutter run
   ```

### Security Notes

- Never commit `.env` files to version control
- The `.env` file is already added to `.gitignore`
- Use different credentials for development, staging, and production

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
