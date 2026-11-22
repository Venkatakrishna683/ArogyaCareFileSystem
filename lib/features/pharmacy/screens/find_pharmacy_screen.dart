import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/widgets/app_textfield.dart';
import '../providers/pharmacy_provider.dart';

class FindPharmacyScreen extends StatefulWidget {
  const FindPharmacyScreen({super.key});
  @override
  State<FindPharmacyScreen> createState() => _FindPharmacyScreenState();
}

class _FindPharmacyScreenState extends State<FindPharmacyScreen> {
  final _ctrl = TextEditingController(text: 'Paracetamol');
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PharmacyProvider(),
      child: Builder(builder: (context) {
        final p = context.watch<PharmacyProvider>();
        return Scaffold(
          appBar: AppBar(title: const Text('Find Pharmacy')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              AppTextField(hint: 'Medicine peru kotandi', controller: _ctrl),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: () => p.search(_ctrl.text), child: const Text('Search')),
              const SizedBox(height: 16),
              if (p.isLoading) const CircularProgressIndicator(),
              if (!p.isLoading && p.results.isEmpty) const Text('Demo: Supabase lo data lekapothe empty vasthundi.\nKindha demo pharmacies chudandi.'),
              Expanded(child: ListView.builder(
                itemCount: 3,
                itemBuilder: (c, i) => Card(child: ListTile(
                  leading: const Icon(Icons.local_pharmacy, color: Colors.green),
                  title: Text('MedPlus Pharmacy ${i + 1}'),
                  subtitle: Text('Price: Rs.${120 + i * 10} • Generic: Rs.${45 + i * 5} • 1.${i + 2} km'),
                  trailing: IconButton(icon: const Icon(Icons.call), onPressed: () => launchUrl(Uri.parse('tel:9845000000'))),
                )),
              )),
            ]),
          ),
        );
      }),
    );
  }
}