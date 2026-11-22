import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/family_provider.dart';

class FamilyVaultScreen extends StatelessWidget {
  const FamilyVaultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FamilyProvider(),
      child: Builder(builder: (context) {
        final members = context.watch<FamilyProvider>().members;
        return Scaffold(
          appBar: AppBar(title: const Text('Family Vault')),
          body: ListView.builder(
            itemCount: members.length,
            itemBuilder: (c, i) => Card(margin: const EdgeInsets.all(12), child: ListTile(leading: CircleAvatar(child: Text(members[i].name[0])), title: Text(members[i].name), subtitle: Text('${members[i].relation} • Age ${members[i].age}'), trailing: const Icon(Icons.arrow_forward_ios, size: 16))),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
        );
      }),
    );
  }
}