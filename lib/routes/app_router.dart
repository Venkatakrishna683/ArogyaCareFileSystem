import 'package:go_router/go_router.dart';
import '../features/auth/screens/language_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/otp_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/upload/screens/upload_screen.dart';
import '../features/prescriptions/screens/prescription_list_screen.dart';
import '../features/prescriptions/screens/prescription_detail_screen.dart';
import '../features/pharmacy/screens/find_pharmacy_screen.dart';
import '../features/family/screens/family_vault_screen.dart';
import '../features/wallet/screens/wallet_screen.dart';
import '../features/reminders/screens/reminder_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/language',
    routes: [
      GoRoute(path: '/language', builder: (c, s) => const LanguageScreen()),
      GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
      GoRoute(path: '/otp', builder: (c, s) {
        final phone = s.extra as String? ?? '';
        return OtpScreen(phone: phone);
      }),
      GoRoute(path: '/home', builder: (c, s) => const HomeScreen()),
      GoRoute(path: '/upload', builder: (c, s) => const UploadScreen()),
      GoRoute(path: '/prescriptions', builder: (c, s) => const PrescriptionListScreen()),
      GoRoute(path: '/prescription-detail', builder: (c, s) => const PrescriptionDetailScreen()),
      GoRoute(path: '/find-pharmacy', builder: (c, s) => const FindPharmacyScreen()),
      GoRoute(path: '/family', builder: (c, s) => const FamilyVaultScreen()),
      GoRoute(path: '/wallet', builder: (c, s) => const WalletScreen()),
      GoRoute(path: '/reminders', builder: (c, s) => const ReminderScreen()),
    ],
  );
}