import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const darkBrown = Color(0xFF3E2723);
  static const softBrown = Color(0xFF8D6E63);
  static const babyPink = Color(0xFFF6C6C9);
  static const cream = Color(0xFFFBF3EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [darkBrown, softBrown],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App bar sederhana biar senada, dengan tombol kembali
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: babyPink, size: 18),
                    ),
                    const Text(
                      'Photobooth',
                      style: TextStyle(
                        color: babyPink,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),

              // Konten utama, senada dengan kartu di login screen
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 44, horizontal: 24),
                      decoration: BoxDecoration(
                        color: cream,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 24,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 84,
                            height: 84,
                            decoration: BoxDecoration(
                              color: babyPink,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: babyPink.withOpacity(0.5),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.download_rounded,
                              color: darkBrown,
                              size: 36,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'ini halaman unduh foto',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: darkBrown,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Konten akan menyusul di sini',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: darkBrown.withOpacity(0.55),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}