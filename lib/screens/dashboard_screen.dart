import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.white,
        elevation: 0.8,
        surfaceTintColor: Colors.white,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: _buildDashboardContent(),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.credit_card_outlined),
            selectedIcon: Icon(Icons.credit_card),
            label: 'Cards',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardContent() {
    return ListView(
      key: const ValueKey('dashboard'),
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Selamat Datang,',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const Text(
          'Putra 👋',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // ==== Kartu Saldo ====
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.06),
                blurRadius: 16,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF4FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.wallet_outlined,
                        color: Color(0xFF2F80ED)),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Saldo Saat Ini',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Rp 1.234.567',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2F80ED),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Fitur Detail Transaksi coming soon 👀'),
                      ),
                    );
                  },
                  child: const Text('Lihat Detail Transaksi'),
                ),
              ),
            ],
          ),
        ),

        // ==== Quick Actions ====
        const SizedBox(height: 22),
        const Text(
          'Quick Actions',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            _QuickAction(icon: Icons.send_outlined, label: 'Kirim'),
            SizedBox(width: 10),
            _QuickAction(icon: Icons.download_outlined, label: 'Tarik'),
            SizedBox(width: 10),
            _QuickAction(icon: Icons.qr_code_scanner, label: 'QRIS'),
            SizedBox(width: 10),
            _QuickAction(icon: Icons.add_card_outlined, label: 'Top Up'),
          ],
        ),

        // ==== Transaksi Terbaru ====
        const SizedBox(height: 24),
        const Text(
          'Recent Transactions',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        const _TxnTile(
          icon: Icons.shopping_bag_outlined,
          title: 'Belanja Marketplace',
          subtitle: 'Kemarin • 14:32',
          amount: '- Rp 125.000',
          negative: true,
        ),
        const _TxnTile(
          icon: Icons.attach_money_outlined,
          title: 'Transfer Masuk',
          subtitle: 'Kemarin • 09:10',
          amount: '+ Rp 500.000',
          negative: false,
        ),
        const _TxnTile(
          icon: Icons.local_dining_outlined,
          title: 'Makan Siang',
          subtitle: 'Senin • 12:15',
          amount: '- Rp 27.000',
          negative: true,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  const _QuickAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: [
              Icon(icon, size: 24, color: const Color(0xFF2F80ED)),
              const SizedBox(height: 6),
              Text(
                label,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TxnTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final bool negative;
  const _TxnTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.negative,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: const Color(0xFFEFF4FF),
          child: Icon(icon, color: const Color(0xFF2F80ED)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(subtitle),
        trailing: Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: negative ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }
}
