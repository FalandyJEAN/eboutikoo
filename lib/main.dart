import 'package:flutter/material.dart';

// ── MAIN ──
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
    ),
    home: const PajAkey(),
  ));
}

// ── IMAGE PWODWI (menm imaj pou tout pwodwi) ──
const String imajPwodwi =
    'https://images.unsplash.com/photo-1600857544200-b2f666a9a2ec?w=400&q=80';

// ══════════════════════════════════════════
// PAJ 1 : AKÈY
// ══════════════════════════════════════════
class PajAkey extends StatelessWidget {
  const PajAkey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const PajMeni()));
          },
        ),
        title: const Text('EBoutikoo'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('PEYE',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(
            height: 130,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF283593),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Center(
              child: Text('Kategori',
                  style: TextStyle(color: Colors.white70, fontSize: 20)),
            ),
          ),
          Container(
            height: 130,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF283593),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Center(
              child: Text('Kategori',
                  style: TextStyle(color: Colors.white70, fontSize: 20)),
            ),
          ),
          Row(
            children: [
              Expanded(child: _kartSavon(context)),
              const SizedBox(width: 10),
              Expanded(child: _kartSavon(context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _kartSavon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const PajDetay()));
      },
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.network(
                  imajPwodwi,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Savon',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    Text('Lorem ipsum Lorem\nipsm Lorem ipsum',
                        style:
                            TextStyle(fontSize: 9, color: Colors.grey[600])),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════
// PAJ 2 : DETAY
// ══════════════════════════════════════════
class PajDetay extends StatelessWidget {
  const PajDetay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DETAY'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('PEYE',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Image.network(
              imajPwodwi,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Lorem ipsum Lorem ipsum\n'
              'ipsm Lorem ipsmLorem\n'
              'ipsmLorem ipsmLorem ipsm\n'
              'Lorem Lorem\n'
              'Lorem Lorem ipsm\n'
              'Lorem Lorem ipsm Lorem ipsm',
              style: TextStyle(fontSize: 14, height: 1.7),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, right: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: const Color(0xFFD4A017),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Savon ajoute nan panye!')),
                  );
                },
                child: const Icon(Icons.shopping_cart, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════
// PAJ 3 : MENI
// ══════════════════════════════════════════
class PajMeni extends StatelessWidget {
  const PajMeni({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('EBoutikoo'),
            const SizedBox(width: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF3949AB),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text('PEYE', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity, height: 170,
            color: const Color(0xFF3949AB),
          ),
          ListTile(
            leading: const Icon(Icons.login, color: Color(0xFF1A237E)),
            title: const Text('Konekte', style: TextStyle(fontSize: 18)),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.list, color: Color(0xFF1A237E)),
            title: const Text('Lis pwodwi', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const PajLis()));
            },
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFF1A237E)),
            title: const Text('Dekonekte', style: TextStyle(fontSize: 18)),
            onTap: () => Navigator.pop(context),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 22, height: 22,
                  decoration: const BoxDecoration(
                      color: Color(0xFFD4A017), shape: BoxShape.circle)),
                const SizedBox(width: 14),
                Container(width: 22, height: 22,
                  decoration: const BoxDecoration(
                      color: Color(0xFF1A237E), shape: BoxShape.circle)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════
// PAJ 4 : LIS PWODWI
// ══════════════════════════════════════════
class PajLis extends StatefulWidget {
  const PajLis({super.key});

  @override
  State<PajLis> createState() => _PajLisState();
}

class _PajLisState extends State<PajLis> {
  final List<bool> _favori = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lis Pwodwi'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('PEYE',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.72,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PajDetay()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1), blurRadius: 4),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(4)),
                            child: Image.network(
                              imajPwodwi,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 6, right: 6,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _favori[i] = !_favori[i];
                                    });
                                  },
                                  child: Icon(
                                    _favori[i]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: _favori[i]
                                        ? Colors.red
                                        : Colors.white70,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Icon(Icons.share,
                                    color: Colors.white70, size: 18),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Savon',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13)),
                            Text('Lorem ipsum Lorem\nipsm Lorem ipsum',
                                style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.grey[600])),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}