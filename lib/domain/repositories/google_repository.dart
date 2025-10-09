import 'dart:convert';
import 'package:google_sign_in_all_platforms/google_sign_in_all_platforms.dart';
import 'package:gtd_manager/env.dart';
import 'package:gtd_manager/main.dart';

class GoogleRepository {
  final _googleSignIn = GoogleSignIn(
    params: const GoogleSignInParams(
      clientId: Env.googleClientId,
      clientSecret: Env.googleClientSecret,
      scopes: [
        'openid',
        'email',
        'profile',
        'https://www.googleapis.com/auth/calendar',
      ],
      redirectPort: 8000,
    ),
  );
  GoogleSignIn get googleSignIn => _googleSignIn;

  Future<Map<String, dynamic>> fetchProfileWithClient() async {
    // Получаем подготовленный authenticated client (он автоматически рефрешит токен)
    final client = await _googleSignIn.authenticatedClient;
    if (client == null) throw Exception('No authenticated client, user not signed in');
    final resp = await client.get(Uri.parse('https://www.googleapis.com/oauth2/v1/userinfo?alt=json'));
    if (resp.statusCode != 200) throw Exception('API error: ${resp.statusCode}');
    return json.decode(resp.body) as Map<String, dynamic>;
  }

  Future<void> fetchCalendarEvents() async {
    final client = await _googleSignIn.authenticatedClient;
    if (client == null) throw Exception('Not signed in');

    final url = Uri.parse(
      'https://www.googleapis.com/calendar/v3/calendars/primary/events',
    );

    final response = await client.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch events: ${response.body}');
    }

    final data = json.decode(response.body);
    talker.info('Events: $data');
  }

  Map<String, dynamic>? decodeIdToken(String? idToken) {
    if (idToken == null) return null;
    final parts = idToken.split('.');
    if (parts.length != 3) return null;
    var payload = parts[1];
    // base64Url padding
    payload = base64Url.normalize(payload);
    final decoded = utf8.decode(base64Url.decode(payload));
    return json.decode(decoded) as Map<String, dynamic>;
  }
}
