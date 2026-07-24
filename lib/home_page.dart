import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const darkBrown = Color(0xFF3E2723);
  static const babyPink = Color(0xFFF6C6C9);
  static const cream = Color(0xFFFBF3EE);

  // 4 foto hasil booking.
  // imagePath harus sama persis dengan nama file di folder assets/images/
  // dan sudah didaftarkan di pubspec.yaml.
  final List<_PhotoItem> _photos = const [
    _PhotoItem(imagePath: 'assets/images/20251226_231305649.jpg', label: 'Foto 1'),
    _PhotoItem(imagePath: 'assets/images/foto2.jpg', label: 'Foto 2'),
    _PhotoItem(imagePath: 'assets/images/strip.jpg', label: 'Photo strip'),
    _PhotoItem(imagePath: 'assets/images/foto3.jpg', label: 'Foto 3'),
  ];

  int _currentIndex = 0;

  void _goTo(int index) {
    setState(() {
      _currentIndex = index.clamp(0, _photos.length - 1);
    });
  }

  void _handleDownload() {
    // TODO: implementasi download foto yang sedang ditampilkan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Mengunduh ${_photos[_currentIndex].label}...'),
        backgroundColor: darkBrown,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final current = _photos[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top bar ala browser ──
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close_rounded, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down_rounded,
                        color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  const Expanded(
                    child: Text(
                      'fotoshare.co',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share_outlined, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
                  ),
                ],
              ),
            ),

            // ── Sisanya background cream ──
            Expanded(
              child: Container(
                width: double.infinity,
                color: cream,
                child: Column(
                  children: [
                    // Label + tombol download/share
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 18, 12, 12),
                      child: Row(
                        children: [
                          Text(
                            current.label,
                            style: TextStyle(
                              color: darkBrown.withOpacity(0.6),
                              fontSize: 15,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: _handleDownload,
                            icon: const Icon(Icons.download_rounded,
                                color: darkBrown),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share_outlined,
                                color: darkBrown),
                          ),
                        ],
                      ),
                    ),

                    // ── Foto besar + navigasi ──
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: darkBrown,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    current.imagePath,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 14,
                                  right: 14,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.55),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      '${_currentIndex + 1}/${_photos.length}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Panah kiri
                          if (_currentIndex > 0)
                            Positioned(
                              left: 4,
                              child: _NavArrow(
                                icon: Icons.chevron_left_rounded,
                                onTap: () => _goTo(_currentIndex - 1),
                              ),
                            ),

                          // Panah kanan
                          if (_currentIndex < _photos.length - 1)
                            Positioned(
                              right: 4,
                              child: _NavArrow(
                                icon: Icons.chevron_right_rounded,
                                onTap: () => _goTo(_currentIndex + 1),
                              ),
                            ),
                        ],
                      ),
                    ),

                    // ── Strip thumbnail ──
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: SizedBox(
                        height: 78,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _photos.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            final item = _photos[index];
                            final isSelected = index == _currentIndex;
                            return GestureDetector(
                              onTap: () => _goTo(index),
                              child: Container(
                                width: 78,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isSelected
                                        ? babyPink
                                        : Colors.transparent,
                                    width: 2.5,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item.imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Bottom bar hitam dengan handle ──
            Container(
              color: Colors.black,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Container(
                  width: 120,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoItem {
  final String imagePath;
  final String label;

  const _PhotoItem({required this.imagePath, required this.label});
}

class _NavArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavArrow({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 26),
      ),
    );
  }
}