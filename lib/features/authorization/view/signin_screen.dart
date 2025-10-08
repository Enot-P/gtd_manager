import 'dart:convert';
import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in_all_platforms/google_sign_in_all_platforms.dart';
import 'package:gtd_manager/env.dart';

// Пример инициализации (для десктопов укажи clientSecret; для мобилов можно опустить)
final googleSignIn = GoogleSignIn(
  params: const GoogleSignInParams(
    clientId: Env.googleClientId,
    clientSecret: Env.googleClientSecret,
    scopes: ['openid', 'email', 'profile'],
    redirectPort: 8000,
  ),
);

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
    // Restore session if possible:
    googleSignIn.silentSignIn();
  }

  Future<Map<String, dynamic>> fetchProfileWithClient() async {
    // Получаем подготовленный authenticated client (он автоматически рефрешит токен)
    final client = await googleSignIn.authenticatedClient;
    if (client == null) throw Exception('No authenticated client, user not signed in');
    final resp = await client.get(Uri.parse('https://www.googleapis.com/oauth2/v1/userinfo?alt=json'));
    if (resp.statusCode != 200) throw Exception('API error: ${resp.statusCode}');
    return json.decode(resp.body) as Map<String, dynamic>;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Sign-In Demo')),
      body: Center(
        child: StreamBuilder<GoogleSignInCredentials?>(
          stream: googleSignIn.authenticationState,
          builder: (context, snap) {
            final creds = snap.data;
            final signedIn = creds != null;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: signedIn ? () => googleSignIn.signOut() : () => googleSignIn.signIn(),
                  child: Text(signedIn ? 'Sign Out' : (kIsWeb ? 'Use sign-in button on web' : 'Sign In')),
                ),
                const SizedBox(height: 12),
                if (signedIn) ...[
                  Text('Access token expires: ${creds.expiresIn}'),
                  ElevatedButton(
                    onPressed: () async {
                      final profile = await fetchProfileWithClient();
                      await showDialog(
                        context: context,
                        builder: (_) => AlertDialog(content: Text(profile.toString())),
                      );
                    },
                    child: const Text('Fetch profile via API'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final info = decodeIdToken(creds.idToken);
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(content: Text(info.toString())),
                      );
                    },
                    child: const Text('Decode idToken'),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
