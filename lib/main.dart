import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class StockageAdapter {
  final GetStorage _box;
  StockageAdapter(this._box);

  Future<void> write(String key, dynamic value) => _box.write(key, value);

  Map<String, dynamic> readAll() {
    final data = <String, dynamic>{};
    for (final key in _box.getKeys()) {
      final k = key.toString();
      data[k] = _box.read(k);
    }
    return data;
  }
}

final stockage = StockageAdapter(GetStorage());
const String kleLisAchte = 'lis_achte';
const String emailOtorizasyon = 'flutter@esih.edu';
const String modpasOtorizasyon = '00000000';
const String lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.';

const List<Map<String, dynamic>> pwoduiYo = [
  {
    'nom': 'Savon',
    'deskripsyon': lorem,
    'afiche':
        'https://images.unsplash.com/photo-1600857544200-b2f666a9a2ec?w=600&q=80',
    'asset': false,
    'link':
        'https://images.unsplash.com/photo-1600857544200-b2f666a9a2ec?w=600&q=80',
  },
  {
    'nom': 'Savon',
    'deskripsyon': lorem,
    'afiche':
        'https://images.unsplash.com/photo-1594035910387-fea47794261f?w=600&q=80',
    'asset': false,
    'link':
        'https://images.unsplash.com/photo-1594035910387-fea47794261f?w=600&q=80',
  },
  {
    'nom': 'Savon',
    'deskripsyon': lorem,
    'afiche':
        'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=600&q=80',
    'asset': false,
    'link':
        'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=600&q=80',
  },
  {
    'nom': 'Savon',
    'deskripsyon': lorem,
    'afiche': 'assets/images/product1.jpg',
    'asset': true,
    'link':
        'https://images.unsplash.com/photo-1600857544200-b2f666a9a2ec?w=600&q=80',
  },
  {
    'nom': 'Savon',
    'deskripsyon': lorem,
    'afiche': 'assets/images/product2.jpg',
    'asset': true,
    'link':
        'https://images.unsplash.com/photo-1594035910387-fea47794261f?w=600&q=80',
  },
  {
    'nom': 'Savon',
    'deskripsyon': lorem,
    'afiche': 'assets/images/product3.jpg',
    'asset': true,
    'link':
        'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=600&q=80',
  },
];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const EboutikooApp());
}

class EboutikooApp extends StatelessWidget {
  const EboutikooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const PajAkey(),
    );
  }
}

List<String> liToutAchat() {
  final allData = stockage.readAll();
  final dynamic list = allData[kleLisAchte];
  if (list is List) return list.map((e) => e.toString()).toList();
  return <String>[];
}

Future<void> achtePwodwi(BuildContext context, String imageLink) async {
  final list = liToutAchat();
  list.add(imageLink);
  await stockage.write(kleLisAchte, list);
  if (!context.mounted) return;
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(const SnackBar(content: Text('Achat anrejistre.')));
}

void aleLisAchte(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const PajLisAchte()),
  );
}

PreferredSizeWidget appBarSenp(
  BuildContext context,
  String title, {
  bool showMenu = false,
}) {
  return AppBar(
    title: Text(title),
    leading: showMenu
        ? IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PajMeni()),
              );
            },
          )
        : null,
    actions: [
      TextButton(
        onPressed: () => aleLisAchte(context),
        child: const Text('PEYE', style: TextStyle(color: Colors.white)),
      ),
    ],
  );
}

Widget imageWidget(String path, bool seAsset, {double? width, double? height}) {
  if (seAsset) {
    return Image.asset(path, width: width, height: height, fit: BoxFit.cover);
  }
  return Image.network(path, width: width, height: height, fit: BoxFit.cover);
}

class PajAkey extends StatelessWidget {
  const PajAkey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSenp(context, 'EBoutikoo', showMenu: true),
      body: const ProduitList(),
    );
  }
}

class ProduitList extends StatelessWidget {
  const ProduitList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pwoduiYo.length,
      itemBuilder: (_, i) {
        final p = pwoduiYo[i];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => PajDetay(p: p)),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 90,
                  height: 90,
                  child: imageWidget(p['afiche'], p['asset']),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p['nom'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        p['deskripsyon'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => achtePwodwi(context, p['link']),
                        child: const Text('Achte'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PajDetay extends StatelessWidget {
  final Map<String, dynamic> p;
  const PajDetay({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSenp(context, 'Detay'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 220,
              child: imageWidget(p['afiche'], p['asset']),
            ),
            const SizedBox(height: 12),
            Text(p['nom'], style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text(p['deskripsyon']),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => achtePwodwi(context, p['link']),
                child: const Text('Achte'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PajMeni extends StatelessWidget {
  const PajMeni({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSenp(context, 'Meni'),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Konekte'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PajKoneksyon()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lis pwodwi'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const PajLis()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: const Text('Lis Achte'),
            onTap: () => aleLisAchte(context),
          ),
        ],
      ),
    );
  }
}

class PajLis extends StatelessWidget {
  const PajLis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSenp(context, 'Lis pwodwi'),
      body: const ProduitList(),
    );
  }
}

class PajLisAchte extends StatefulWidget {
  const PajLisAchte({super.key});

  @override
  State<PajLisAchte> createState() => _PajLisAchteState();
}

class _PajLisAchteState extends State<PajLisAchte> {
  late List<String> lyenAchte;

  @override
  void initState() {
    super.initState();
    lyenAchte = liToutAchat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSenp(context, 'Lis Achte'),
      body: lyenAchte.isEmpty
          ? const Center(child: Text('Pa gen acha anrejistre.'))
          : ListView.builder(
              itemCount: lyenAchte.length,
              itemBuilder: (_, i) {
                final link = lyenAchte[i];
                return ListTile(
                  leading: SizedBox(
                    width: 56,
                    height: 56,
                    child: Image.network(link, fit: BoxFit.cover),
                  ),
                  title: Text(
                    link,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
    );
  }
}

class PajKoneksyon extends StatefulWidget {
  const PajKoneksyon({super.key});

  @override
  State<PajKoneksyon> createState() => _PajKoneksyonState();
}

class _PajKoneksyonState extends State<PajKoneksyon> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void soumettre(String action) {
    if (!_formKey.currentState!.validate()) return;
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email == emailOtorizasyon && password == modpasOtorizasyon) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$action reyisi.')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PajAkey()),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Email oswa modpas pa korek.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSenp(context, 'Login / Sign'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                showCursor: true,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'flutter@esih.edu',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final v = (value ?? '').trim();
                  if (v.isEmpty) return 'Antre email.';
                  if (!v.contains('@')) return 'Email pa valab.';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                showCursor: true,
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        setState(() => _showPassword = !_showPassword),
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                validator: (value) {
                  final v = value ?? '';
                  if (v.isEmpty) return 'Antre mot de passe.';
                  if (v.length < 8) return 'Minimom 8 karakte.';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => soumettre('Login'),
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => soumettre('Sign'),
                      child: const Text('Sign'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
