import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chrono Luxe - Luxury Watches',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF722F37)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/product') {
          final args = settings.arguments as Map<String, dynamic>?;
          return MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: args),
          );
        }

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const LandingPage());
          case '/collection':
            return MaterialPageRoute(builder: (_) => const CollectionPage());
          case '/about':
            return MaterialPageRoute(builder: (_) => const AboutPage());
          case '/contact':
            return MaterialPageRoute(builder: (_) => const ContactPage());
          case '/cart':
            return MaterialPageRoute(builder: (_) => const CartPage());
          default:
            return MaterialPageRoute(builder: (_) => const LandingPage());
        }
      },
    );
  }
}

// ============================================================================
// CONSTANTS & DATA
// ============================================================================

class AppColors {
  static const Color primary = Color(0xFF722F37);
  static const Color primaryDark = Color(0xFF4A1C23);
  static const Color gold = Color(0xFFD4AF37);
  static const Color darkText = Color(0xFF1A1A1A);
  static const Color greyText = Color(0xFF555555);
  static const Color lightBg = Color(0xFFF9F7F5);
  static const Color white = Colors.white;
  static const Color success = Color(0xFF4CAF50);
}

class WatchData {
  static final List<Map<String, dynamic>> products = [
    {
      'id': '1',
      'image': 'assets/images/watch1.jpg',
      'name': 'Patek Philippe Calatrava',
      'brand': 'Patek Philippe',
      'price': 24500.0,
      'category': 'Dress',
      'description':
          'The Calatrava is a masterpiece of understated elegance. Its pure, perfectly balanced lines have made it the very essence of the round wristwatch.',
      'specs': {
        'Movement': 'Automatic',
        'Case Size': '39mm',
        'Water Resistance': '30m',
        'Crystal': 'Sapphire',
        'Strap': 'Leather',
      },
    },
    {
      'id': '2',
      'image': 'assets/images/watch2.jpg',
      'name': 'Rolex Submariner',
      'brand': 'Rolex',
      'price': 12800.0,
      'category': 'Sport',
      'description':
          'A benchmark in diving watches, the Submariner combines robustness and elegance with unparalleled performance.',
      'specs': {
        'Movement': 'Automatic',
        'Case Size': '41mm',
        'Water Resistance': '300m',
        'Crystal': 'Sapphire',
        'Strap': 'Steel Bracelet',
      },
    },
    {
      'id': '3',
      'image': 'assets/images/watch3.jpg',
      'name': 'Omega Seamaster',
      'brand': 'Omega',
      'price': 6200.0,
      'category': 'Sport',
      'description':
          'The choice of James Bond, the Seamaster delivers exceptional water resistance and timeless design.',
      'specs': {
        'Movement': 'Co-Axial Automatic',
        'Case Size': '42mm',
        'Water Resistance': '300m',
        'Crystal': 'Sapphire',
        'Strap': 'Steel Bracelet',
      },
    },
    {
      'id': '4',
      'image': 'assets/images/watch4.jpg',
      'name': 'Audemars Piguet Royal Oak',
      'brand': 'Audemars Piguet',
      'price': 32000.0,
      'category': 'Luxury Sport',
      'description':
          'Revolutionary when it was launched in 1972, the Royal Oak broke conventions with its octagonal bezel and integrated bracelet.',
      'specs': {
        'Movement': 'Automatic',
        'Case Size': '41mm',
        'Water Resistance': '50m',
        'Crystal': 'Sapphire',
        'Strap': 'Steel Bracelet',
      },
    },
    {
      'id': '5',
      'image': 'assets/images/watch5.jpg',
      'name': 'Cartier Tank Française',
      'brand': 'Cartier',
      'price': 8900.0,
      'category': 'Dress',
      'description':
          'An icon of watchmaking design, the Tank embodies timeless elegance with its distinctive rectangular case.',
      'specs': {
        'Movement': 'Quartz',
        'Case Size': '32mm',
        'Water Resistance': '30m',
        'Crystal': 'Sapphire',
        'Strap': 'Steel Bracelet',
      },
    },
    {
      'id': '6',
      'image': 'assets/images/watch6.jpg',
      'name': 'IWC Portugieser',
      'brand': 'IWC',
      'price': 9400.0,
      'category': 'Dress',
      'description':
          'The Portugieser chronograph is a masterful blend of precision engineering and classic design.',
      'specs': {
        'Movement': 'Automatic Chronograph',
        'Case Size': '41mm',
        'Water Resistance': '30m',
        'Crystal': 'Sapphire',
        'Strap': 'Leather',
      },
    },
    {
      'id': '7',
      'image': 'assets/images/watch7.jpg',
      'name': 'Jaeger-LeCoultre Reverso',
      'brand': 'Jaeger-LeCoultre',
      'price': 11200.0,
      'category': 'Dress',
      'description':
          'Originally designed for polo players, the reversible case of the Reverso is an Art Deco masterpiece.',
      'specs': {
        'Movement': 'Manual',
        'Case Size': '42mm',
        'Water Resistance': '30m',
        'Crystal': 'Sapphire',
        'Strap': 'Leather',
      },
    },
    {
      'id': '8',
      'image': 'assets/images/watch8.jpg',
      'name': 'Vacheron Constantin Overseas',
      'brand': 'Vacheron Constantin',
      'price': 28500.0,
      'category': 'Luxury Sport',
      'description':
          'The Overseas collection embodies the spirit of travel with its sophisticated sporty elegance.',
      'specs': {
        'Movement': 'Automatic',
        'Case Size': '41mm',
        'Water Resistance': '150m',
        'Crystal': 'Sapphire',
        'Strap': 'Interchangeable',
      },
    },
  ];

  static List<Map<String, dynamic>> cart = [];
}

// ============================================================================
// SHARED WIDGETS
// ============================================================================

class SharedNavbar extends StatelessWidget {
  final bool showBack;
  final String? title;

  const SharedNavbar({super.key, this.showBack = false, this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
            child: Row(
              children: [
                if (showBack) ...[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.darkText,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                Icon(Icons.watch_outlined, size: 36, color: AppColors.primary),
                const SizedBox(width: 12),
                Text(
                  title ?? 'CHRONO LUXE',
                  style: TextStyle(
                    fontSize: isDesktop ? 24 : 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: AppColors.darkText,
                  ),
                ),
              ],
            ),
          ),
          if (isDesktop)
            Row(
              children: [
                _NavLink(text: 'Home', route: '/'),
                const SizedBox(width: 32),
                _NavLink(text: 'Collection', route: '/collection'),
                const SizedBox(width: 32),
                _NavLink(text: 'About', route: '/about'),
                const SizedBox(width: 32),
                _NavLink(text: 'Contact', route: '/contact'),
                const SizedBox(width: 40),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: AppColors.darkText),
                ),
                IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/cart'),
                  icon: Badge(
                    label: Text('${WatchData.cart.length}'),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.darkText,
                    ),
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/cart'),
                  icon: Badge(
                    label: Text('${WatchData.cart.length}'),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.darkText,
                    ),
                  ),
                ),
                Builder(
                  builder:
                      (context) => IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: const Icon(Icons.menu, color: AppColors.darkText),
                      ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String text;
  final String route;
  const _NavLink({required this.text, required this.route});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (widget.route == '/') {
            Navigator.pushReplacementNamed(context, widget.route);
          } else {
            Navigator.pushNamed(context, widget.route);
          }
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _isHovered ? AppColors.primary : AppColors.greyText,
            letterSpacing: 1,
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.watch_outlined,
                        size: 32,
                        color: AppColors.white,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'CHRONO LUXE',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Luxury Timepieces',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            _DrawerItem(
              icon: Icons.home_outlined,
              title: 'Home',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            _DrawerItem(
              icon: Icons.watch_outlined,
              title: 'Collection',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/collection');
              },
            ),
            _DrawerItem(
              icon: Icons.info_outline,
              title: 'About',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            _DrawerItem(
              icon: Icons.mail_outline,
              title: 'Contact',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
            const Divider(),
            _DrawerItem(
              icon: Icons.shopping_bag_outlined,
              title: 'Cart (${WatchData.cart.length})',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: AppColors.darkText),
      ),
      onTap: onTap,
    );
  }
}

class SharedFooter extends StatelessWidget {
  const SharedFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: 60,
      ),
      color: AppColors.darkText,
      child: Column(
        children: [
          isDesktop || isTablet
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.watch_outlined,
                              size: 32,
                              color: AppColors.white,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'CHRONO LUXE',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Curating the world\'s finest timepieces for discerning collectors since 1998.',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.white.withOpacity(0.7),
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 60),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'QUICK LINKS',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _FooterLink(text: 'Home', route: '/'),
                        _FooterLink(text: 'Collection', route: '/collection'),
                        _FooterLink(text: 'About Us', route: '/about'),
                        _FooterLink(text: 'Contact', route: '/contact'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CONTACT US',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '123 Luxury Avenue\nNew York, NY 10001',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.white.withOpacity(0.7),
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'info@chronoluxe.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
              : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.watch_outlined,
                        size: 32,
                        color: AppColors.white,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'CHRONO LUXE',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'info@chronoluxe.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
          const SizedBox(height: 48),
          Divider(color: AppColors.white.withOpacity(0.2)),
          const SizedBox(height: 24),
          Text(
            '© ${DateTime.now().year} Chrono Luxe. All rights reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.white.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String text;
  final String route;
  const _FooterLink({required this.text, required this.route});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, widget.route),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 14,
              color:
                  _isHovered
                      ? AppColors.white
                      : AppColors.white.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// LANDING PAGE
// ============================================================================

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SharedNavbar(),
            _HeroSection(),
            _FeaturesSection(),
            _ProductsSection(),
            _ShowcaseSection(),
            _StatsSection(),
            _TestimonialsSection(),
            _FaqSection(),
            _CtaSection(),
            SharedFooter(),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 80 : 60),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.lightBg, AppColors.white],
        ),
      ),
      child:
          isDesktop || isTablet
              ? Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TIMELESS',
                          style: TextStyle(
                            fontSize: isDesktop ? 64 : 48,
                            fontWeight: FontWeight.w300,
                            color: AppColors.greyText,
                            letterSpacing: 8,
                            height: 1.1,
                          ),
                        ),
                        Text(
                          'ELEGANCE',
                          style: TextStyle(
                            fontSize: isDesktop ? 64 : 48,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                            letterSpacing: 4,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Discover our exclusive collection of luxury timepieces. Crafted with precision, designed for those who appreciate the art of horology.',
                          style: TextStyle(
                            fontSize: isDesktop ? 18 : 16,
                            color: AppColors.greyText,
                            height: 1.7,
                          ),
                        ),
                        const SizedBox(height: 48),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed:
                                  () => Navigator.pushNamed(
                                    context,
                                    '/collection',
                                  ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: isDesktop ? 48 : 32,
                                  vertical: isDesktop ? 20 : 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'SHOP NOW',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            OutlinedButton(
                              onPressed:
                                  () => Navigator.pushNamed(context, '/about'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.darkText,
                                padding: EdgeInsets.symmetric(
                                  horizontal: isDesktop ? 48 : 32,
                                  vertical: isDesktop ? 20 : 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                side: const BorderSide(
                                  color: AppColors.darkText,
                                ),
                              ),
                              child: const Text(
                                'LEARN MORE',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 80),
                  Expanded(
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        color: AppColors.lightBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/watch1.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              )
              : Column(
                children: [
                  const Text(
                    'TIMELESS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      color: AppColors.greyText,
                      letterSpacing: 6,
                      height: 1.1,
                    ),
                  ),
                  const Text(
                    'ELEGANCE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      letterSpacing: 4,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Discover our exclusive collection of luxury timepieces.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.greyText,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/images/watch1.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed:
                        () => Navigator.pushNamed(context, '/collection'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'SHOP NOW',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}

class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;

    final features = [
      {
        'icon': Icons.verified_outlined,
        'title': 'AUTHENTICITY',
        'desc': '100% genuine luxury watches',
      },
      {
        'icon': Icons.local_shipping_outlined,
        'title': 'FREE SHIPPING',
        'desc': 'Worldwide express delivery',
      },
      {
        'icon': Icons.autorenew,
        'title': '30-DAY RETURNS',
        'desc': 'Hassle-free returns',
      },
      {
        'icon': Icons.support_agent_outlined,
        'title': '24/7 SUPPORT',
        'desc': 'Expert assistance anytime',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 80 : 60,
      ),
      color: AppColors.white,
      child:
          isDesktop || isTablet
              ? Row(
                children:
                    features
                        .map(
                          (f) => Expanded(
                            child: Column(
                              children: [
                                Icon(
                                  f['icon'] as IconData,
                                  size: 40,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  f['title'] as String,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                    color: AppColors.darkText,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  f['desc'] as String,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.greyText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              )
              : Column(
                children:
                    features
                        .map(
                          (f) => Padding(
                            padding: const EdgeInsets.only(bottom: 32),
                            child: Column(
                              children: [
                                Icon(
                                  f['icon'] as IconData,
                                  size: 40,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  f['title'] as String,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                    color: AppColors.darkText,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  f['desc'] as String,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.greyText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
    );
  }
}

class _ProductsSection extends StatelessWidget {
  const _ProductsSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;
    final isMobile = screenWidth <= 800;

    int crossAxisCount = isDesktop ? 4 : (isTablet ? 3 : 2);
    double aspectRatio = isMobile ? 0.62 : 0.75;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 12),
        vertical: isDesktop ? 100 : 60,
      ),
      color: AppColors.lightBg,
      child: Column(
        children: [
          const Text(
            'OUR COLLECTION',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 4,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Featured Timepieces',
            style: TextStyle(
              fontSize: isDesktop ? 42 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: isMobile ? 8 : 24,
              mainAxisSpacing: isMobile ? 8 : 24,
              childAspectRatio: aspectRatio,
            ),
            itemCount: WatchData.products.length,
            itemBuilder: (context, index) {
              final product = WatchData.products[index];
              return _ProductCard(product: product);
            },
          ),
          const SizedBox(height: 48),
          OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, '/collection'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              side: const BorderSide(color: AppColors.primary),
            ),
            child: const Text(
              'VIEW ALL COLLECTION',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatefulWidget {
  final Map<String, dynamic> product;
  const _ProductCard({required this.product});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 800;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap:
            () => Navigator.pushNamed(
              context,
              '/product',
              arguments: widget.product,
            ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow:
                _isHovered
                    ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ]
                    : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      color: AppColors.lightBg,
                      child: Image.asset(
                        widget.product['image'],
                        fit: BoxFit.contain,
                      ),
                    ),
                    if (_isHovered && !isMobile)
                      Positioned(
                        bottom: 12,
                        left: 12,
                        right: 12,
                        child: ElevatedButton(
                          onPressed: () {
                            WatchData.cart.add(widget.product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${widget.product['name']} added to cart',
                                ),
                                backgroundColor: AppColors.primary,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'ADD TO CART',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(isMobile ? 8 : 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.product['name'],
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: isMobile ? 2 : 4),
                    Text(
                      '\$${widget.product['price'].toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShowcaseSection extends StatelessWidget {
  const _ShowcaseSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : 60,
      ),
      color: AppColors.white,
      child:
          isDesktop || isTablet
              ? Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 500,
                      child: Image.asset(
                        'assets/images/watch9.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 80),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CRAFTSMANSHIP',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 4,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'The Art of Precision',
                          style: TextStyle(
                            fontSize: isDesktop ? 42 : 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkText,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Each timepiece in our collection represents generations of horological expertise. From the intricate movements to the finest materials, every detail is crafted to perfection.',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.greyText,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: const [
                            _ShowcaseStat(
                              number: '150+',
                              label: 'Years Heritage',
                            ),
                            SizedBox(width: 48),
                            _ShowcaseStat(
                              number: '50+',
                              label: 'Master Craftsmen',
                            ),
                            SizedBox(width: 48),
                            _ShowcaseStat(number: '100%', label: 'Handcrafted'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
              : Column(
                children: [
                  const Text(
                    'CRAFTSMANSHIP',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 4,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The Art of Precision',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkText,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      'assets/images/watch9.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Each timepiece represents generations of horological expertise.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.greyText,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _ShowcaseStat(number: '150+', label: 'Years'),
                      _ShowcaseStat(number: '50+', label: 'Craftsmen'),
                      _ShowcaseStat(number: '100%', label: 'Handcrafted'),
                    ],
                  ),
                ],
              ),
    );
  }
}

class _ShowcaseStat extends StatelessWidget {
  final String number;
  final String label;
  const _ShowcaseStat({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.greyText,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}

class _StatsSection extends StatelessWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    final stats = [
      {'number': '10,000+', 'label': 'Happy Customers'},
      {'number': '500+', 'label': 'Luxury Watches'},
      {'number': '50+', 'label': 'Premium Brands'},
      {'number': '25+', 'label': 'Years Experience'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: isDesktop ? 80 : 60,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
      ),
      child:
          isDesktop
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    stats
                        .map(
                          (s) => Column(
                            children: [
                              Text(
                                s['number']!,
                                style: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                s['label']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.white.withOpacity(0.8),
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              )
              : Wrap(
                spacing: 40,
                runSpacing: 40,
                alignment: WrapAlignment.spaceAround,
                children:
                    stats
                        .map(
                          (s) => SizedBox(
                            width: 140,
                            child: Column(
                              children: [
                                Text(
                                  s['number']!,
                                  style: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  s['label']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.white.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
    );
  }
}

class _TestimonialsSection extends StatelessWidget {
  const _TestimonialsSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;

    final testimonials = [
      {
        'text':
            'Exceptional service and an incredible selection. Found my dream Patek Philippe here.',
        'author': 'James Morrison',
        'role': 'CEO, Tech Innovations',
      },
      {
        'text':
            'The attention to detail is remarkable. Every step was handled with utmost professionalism.',
        'author': 'Sarah Chen',
        'role': 'Investment Banker',
      },
      {
        'text':
            'I\'ve purchased three watches from Chrono Luxe. Each time, the experience has been flawless.',
        'author': 'Michael Roberts',
        'role': 'Collector',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: isDesktop ? 100 : 60,
      ),
      color: AppColors.lightBg,
      child: Column(
        children: [
          const Text(
            'TESTIMONIALS',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 4,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'What Our Clients Say',
            style: TextStyle(
              fontSize: isDesktop ? 42 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 60),
          isDesktop
              ? IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:
                      testimonials.asMap().entries.map((entry) {
                        final t = entry.value;
                        return Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: entry.key > 0 ? 30 : 0,
                            ),
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 20,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (_) => const Icon(
                                      Icons.star,
                                      color: AppColors.gold,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  t['text']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.greyText,
                                    height: 1.7,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const Spacer(),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 24,
                                      backgroundColor: AppColors.primary
                                          .withOpacity(0.1),
                                      child: Text(
                                        t['author']![0],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          t['author']!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.darkText,
                                          ),
                                        ),
                                        Text(
                                          t['role']!,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: AppColors.greyText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
              )
              : Column(
                children:
                    testimonials
                        .map(
                          (t) => Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (_) => const Icon(
                                      Icons.star,
                                      color: AppColors.gold,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  t['text']!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: AppColors.greyText,
                                    height: 1.6,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  '— ${t['author']}, ${t['role']}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
        ],
      ),
    );
  }
}

class _FaqSection extends StatelessWidget {
  const _FaqSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: isDesktop ? 100 : 60,
      ),
      color: AppColors.white,
      child: Column(
        children: [
          const Text(
            'FAQ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 4,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: isDesktop ? 42 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 60),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: const [
                _FaqItem(
                  question: 'Are all watches authentic?',
                  answer:
                      'Yes, every watch we sell is 100% authentic with original documentation and certificates.',
                ),
                _FaqItem(
                  question: 'What is your return policy?',
                  answer:
                      'We offer a 30-day return policy for all unworn watches in original condition.',
                ),
                _FaqItem(
                  question: 'Do you offer international shipping?',
                  answer:
                      'Yes, we ship worldwide with full insurance via secure express courier.',
                ),
                _FaqItem(
                  question: 'Do you provide warranty?',
                  answer:
                      'All watches come with manufacturer warranty plus our own 2-year guarantee.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;
  const _FaqItem({required this.question, required this.answer});

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(color: AppColors.lightBg),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.question,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkText,
                      ),
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.remove : Icons.add,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Text(
                widget.answer,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.greyText,
                  height: 1.7,
                ),
              ),
            ),
            crossFadeState:
                _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}

class _CtaSection extends StatelessWidget {
  const _CtaSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: isDesktop ? 100 : 60,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkText,
        image: DecorationImage(
          image: const AssetImage('assets/images/watch10.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.7),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'JOIN THE ELITE',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 4,
              color: AppColors.gold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Subscribe for Exclusive Access',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 42 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Be the first to know about new arrivals and exclusive offers',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            height: 52,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: AppColors.greyText),
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'SUBSCRIBE',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// COLLECTION PAGE
// ============================================================================

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String _selectedCategory = 'All';
  String _selectedBrand = 'All';
  String _sortBy = 'Featured';

  List<Map<String, dynamic>> get filteredProducts {
    var products = List<Map<String, dynamic>>.from(WatchData.products);

    if (_selectedCategory != 'All') {
      products =
          products.where((p) => p['category'] == _selectedCategory).toList();
    }
    if (_selectedBrand != 'All') {
      products = products.where((p) => p['brand'] == _selectedBrand).toList();
    }

    switch (_sortBy) {
      case 'Price: Low to High':
        products.sort(
          (a, b) => (a['price'] as double).compareTo(b['price'] as double),
        );
        break;
      case 'Price: High to Low':
        products.sort(
          (a, b) => (b['price'] as double).compareTo(a['price'] as double),
        );
        break;
      case 'Name':
        products.sort(
          (a, b) => (a['name'] as String).compareTo(b['name'] as String),
        );
        break;
    }

    return products;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;
    final isMobile = screenWidth <= 800;

    final categories = ['All', 'Dress', 'Sport', 'Luxury Sport'];
    final brands = [
      'All',
      ...WatchData.products.map((p) => p['brand'] as String).toSet(),
    ];

    return Scaffold(
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SharedNavbar(showBack: true, title: 'COLLECTION'),

            // Hero Banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 20,
                vertical: isDesktop ? 80 : 40,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.primary, AppColors.primaryDark],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Our Collection',
                    style: TextStyle(
                      fontSize: isDesktop ? 48 : 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Discover ${WatchData.products.length} exceptional timepieces',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

            // Filters
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 20,
                vertical: 24,
              ),
              color: AppColors.white,
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Category: ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      DropdownButton<String>(
                        value: _selectedCategory,
                        underline: const SizedBox(),
                        items:
                            categories
                                .map(
                                  (c) => DropdownMenuItem(
                                    value: c,
                                    child: Text(c),
                                  ),
                                )
                                .toList(),
                        onChanged:
                            (v) => setState(() => _selectedCategory = v!),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Brand: ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      DropdownButton<String>(
                        value: _selectedBrand,
                        underline: const SizedBox(),
                        items:
                            brands
                                .map(
                                  (b) => DropdownMenuItem(
                                    value: b,
                                    child: Text(b),
                                  ),
                                )
                                .toList(),
                        onChanged: (v) => setState(() => _selectedBrand = v!),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Sort: ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      DropdownButton<String>(
                        value: _sortBy,
                        underline: const SizedBox(),
                        items:
                            [
                                  'Featured',
                                  'Price: Low to High',
                                  'Price: High to Low',
                                  'Name',
                                ]
                                .map(
                                  (s) => DropdownMenuItem(
                                    value: s,
                                    child: Text(s),
                                  ),
                                )
                                .toList(),
                        onChanged: (v) => setState(() => _sortBy = v!),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Products Grid
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : (isTablet ? 40 : 12),
                vertical: 40,
              ),
              color: AppColors.lightBg,
              child:
                  filteredProducts.isEmpty
                      ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(60),
                          child: Text(
                            'No watches found matching your criteria',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.greyText,
                            ),
                          ),
                        ),
                      )
                      : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isDesktop ? 4 : (isTablet ? 3 : 2),
                          crossAxisSpacing: isMobile ? 8 : 24,
                          mainAxisSpacing: isMobile ? 8 : 24,
                          childAspectRatio: isMobile ? 0.68 : 0.75,
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder:
                            (context, index) =>
                                _ProductCard(product: filteredProducts[index]),
                      ),
            ),

            const SharedFooter(),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// PRODUCT DETAIL PAGE
// ============================================================================

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic>? product;
  const ProductDetailPage({super.key, this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product = widget.product ?? WatchData.products[0];
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;

    return Scaffold(
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SharedNavbar(showBack: true),

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
                vertical: isDesktop ? 60 : 30,
              ),
              child:
                  isDesktop || isTablet
                      ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image
                          Expanded(
                            child: Container(
                              height: 500,
                              decoration: BoxDecoration(
                                color: AppColors.lightBg,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                product['image'],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(width: 60),
                          // Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['brand'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  product['name'],
                                  style: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkText,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  '\$${product['price'].toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  product['description'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.greyText,
                                    height: 1.8,
                                  ),
                                ),
                                const SizedBox(height: 32),

                                // Specs
                                const Text(
                                  'SPECIFICATIONS',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                    color: AppColors.darkText,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ...(product['specs'] as Map<String, String>)
                                    .entries
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 12,
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 140,
                                              child: Text(
                                                e.key,
                                                style: const TextStyle(
                                                  color: AppColors.greyText,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              e.value,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                const SizedBox(height: 32),

                                // Quantity & Add to Cart
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.greyText.withOpacity(
                                            0.3,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed:
                                                () => setState(
                                                  () =>
                                                      _quantity =
                                                          (_quantity > 1)
                                                              ? _quantity - 1
                                                              : 1,
                                                ),
                                            icon: const Icon(Icons.remove),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            child: Text(
                                              '$_quantity',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed:
                                                () =>
                                                    setState(() => _quantity++),
                                            icon: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 24),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          for (var i = 0; i < _quantity; i++) {
                                            WatchData.cart.add(product);
                                          }
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                '$_quantity x ${product['name']} added to cart',
                                              ),
                                              backgroundColor:
                                                  AppColors.primary,
                                              action: SnackBarAction(
                                                label: 'VIEW CART',
                                                textColor: AppColors.white,
                                                onPressed:
                                                    () => Navigator.pushNamed(
                                                      context,
                                                      '/cart',
                                                    ),
                                              ),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          foregroundColor: AppColors.white,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 20,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              0,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'ADD TO CART',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 32),

                                // Features
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.verified_outlined,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    SizedBox(width: 8),
                                    Text('100% Authentic'),
                                    SizedBox(width: 24),
                                    Icon(
                                      Icons.local_shipping_outlined,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    SizedBox(width: 8),
                                    Text('Free Shipping'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                      : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.lightBg,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              product['image'],
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            product['brand'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product['name'],
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkText,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '\$${product['price'].toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            product['description'],
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.greyText,
                              height: 1.7,
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                WatchData.cart.add(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${product['name']} added to cart',
                                    ),
                                    backgroundColor: AppColors.primary,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              child: const Text(
                                'ADD TO CART',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
            ),

            const SharedFooter(),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// CART PAGE
// ============================================================================

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get subtotal =>
      WatchData.cart.fold(0, (sum, item) => sum + (item['price'] as double));
  double get shipping => subtotal > 10000 ? 0 : 99;
  double get total => subtotal + shipping;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;

    // Group cart items
    final groupedCart = <String, Map<String, dynamic>>{};
    for (var item in WatchData.cart) {
      final id = item['id'] as String;
      if (groupedCart.containsKey(id)) {
        groupedCart[id]!['quantity'] =
            (groupedCart[id]!['quantity'] as int) + 1;
      } else {
        groupedCart[id] = {...item, 'quantity': 1};
      }
    }

    return Scaffold(
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SharedNavbar(showBack: true, title: 'SHOPPING CART'),

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
                vertical: isDesktop ? 60 : 30,
              ),
              constraints: const BoxConstraints(minHeight: 500),
              child:
                  WatchData.cart.isEmpty
                      ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 80,
                              color: AppColors.greyText.withOpacity(0.3),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'Your cart is empty',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkText,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Discover our collection of luxury timepieces',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.greyText,
                              ),
                            ),
                            const SizedBox(height: 32),
                            ElevatedButton(
                              onPressed:
                                  () => Navigator.pushNamed(
                                    context,
                                    '/collection',
                                  ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 48,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              child: const Text(
                                'SHOP NOW',
                                style: TextStyle(letterSpacing: 2),
                              ),
                            ),
                          ],
                        ),
                      )
                      : isDesktop || isTablet
                      ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Cart Items
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cart Items (${WatchData.cart.length})',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                ...groupedCart.values.map(
                                  (item) => _CartItem(
                                    item: item,
                                    onRemove: () {
                                      setState(() {
                                        WatchData.cart.removeWhere(
                                          (i) => i['id'] == item['id'],
                                        );
                                      });
                                    },
                                    onUpdateQuantity: (qty) {
                                      setState(() {
                                        WatchData.cart.removeWhere(
                                          (i) => i['id'] == item['id'],
                                        );
                                        for (var i = 0; i < qty; i++) {
                                          WatchData.cart.add(
                                            WatchData.products.firstWhere(
                                              (p) => p['id'] == item['id'],
                                            ),
                                          );
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 60),
                          // Order Summary
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                color: AppColors.lightBg,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Order Summary',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  _SummaryRow(
                                    label: 'Subtotal',
                                    value:
                                        '\$${subtotal.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                                  ),
                                  const SizedBox(height: 12),
                                  _SummaryRow(
                                    label: 'Shipping',
                                    value:
                                        shipping == 0
                                            ? 'FREE'
                                            : '\$${shipping.toStringAsFixed(0)}',
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Divider(),
                                  ),
                                  _SummaryRow(
                                    label: 'Total',
                                    value:
                                        '\$${total.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                                    isBold: true,
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Demo: Checkout functionality would go here',
                                            ),
                                            backgroundColor: AppColors.primary,
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        foregroundColor: AppColors.white,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 18,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            0,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'CHECKOUT',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  if (shipping > 0)
                                    Text(
                                      'Free shipping on orders over \$10,000',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: AppColors.greyText,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                      : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cart Items (${WatchData.cart.length})',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ...groupedCart.values.map(
                            (item) => _CartItemMobile(
                              item: item,
                              onRemove:
                                  () => setState(
                                    () => WatchData.cart.removeWhere(
                                      (i) => i['id'] == item['id'],
                                    ),
                                  ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.lightBg,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                _SummaryRow(
                                  label: 'Subtotal',
                                  value: '\$${subtotal.toStringAsFixed(0)}',
                                ),
                                const SizedBox(height: 8),
                                _SummaryRow(
                                  label: 'Shipping',
                                  value:
                                      shipping == 0
                                          ? 'FREE'
                                          : '\$${shipping.toStringAsFixed(0)}',
                                ),
                                const Divider(height: 24),
                                _SummaryRow(
                                  label: 'Total',
                                  value: '\$${total.toStringAsFixed(0)}',
                                  isBold: true,
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: AppColors.white,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    child: const Text(
                                      'CHECKOUT',
                                      style: TextStyle(letterSpacing: 2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
            ),

            const SharedFooter(),
          ],
        ),
      ),
    );
  }
}

class _CartItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onRemove;
  final Function(int) onUpdateQuantity;

  const _CartItem({
    required this.item,
    required this.onRemove,
    required this.onUpdateQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final quantity = item['quantity'] as int;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.lightBg),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.lightBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(item['image'], fit: BoxFit.contain),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['brand'],
                  style: const TextStyle(color: AppColors.greyText),
                ),
                const SizedBox(height: 12),
                Text(
                  '\$${(item['price'] as double).toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyText.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed:
                      () => onUpdateQuantity(quantity > 1 ? quantity - 1 : 1),
                  icon: const Icon(Icons.remove, size: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    '$quantity',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                  onPressed: () => onUpdateQuantity(quantity + 1),
                  icon: const Icon(Icons.add, size: 18),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.delete_outline, color: AppColors.greyText),
          ),
        ],
      ),
    );
  }
}

class _CartItemMobile extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onRemove;

  const _CartItemMobile({required this.item, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.lightBg),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.lightBg,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.asset(item['image'], fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Qty: ${item['quantity']}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.greyText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${(item['price'] as double).toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.close, size: 20),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isBold ? 18 : 15,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isBold ? AppColors.darkText : AppColors.greyText,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 18 : 15,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            color: isBold ? AppColors.primary : AppColors.darkText,
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// ABOUT PAGE
// ============================================================================

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;

    return Scaffold(
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SharedNavbar(showBack: true, title: 'ABOUT US'),

            // Hero
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 20,
                vertical: isDesktop ? 100 : 60,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.primary, AppColors.primaryDark],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Our Story',
                    style: TextStyle(
                      fontSize: isDesktop ? 56 : 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'A Legacy of Excellence Since 1998',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            // Story Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 20,
                vertical: isDesktop ? 80 : 40,
              ),
              child:
                  isDesktop || isTablet
                      ? Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'WHO WE ARE',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 4,
                                    color: AppColors.primary,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Curators of Time',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkText,
                                  ),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  'Chrono Luxe was founded with a simple mission: to connect discerning collectors with the world\'s finest timepieces. What began as a small boutique in New York has grown into a globally recognized destination for luxury watches.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.greyText,
                                    height: 1.8,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Our team of expert horologists personally verifies every timepiece, ensuring authenticity and quality that meets our exacting standards. We believe that a watch is more than an accessory—it\'s a legacy.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.greyText,
                                    height: 1.8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 80),
                          Expanded(
                            child: Container(
                              height: 400,
                              decoration: BoxDecoration(
                                color: AppColors.lightBg,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.watch,
                                  size: 120,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      : Column(
                        children: const [
                          Text(
                            'WHO WE ARE',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 4,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Curators of Time',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkText,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Chrono Luxe was founded with a simple mission: to connect discerning collectors with the world\'s finest timepieces.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.greyText,
                              height: 1.7,
                            ),
                          ),
                        ],
                      ),
            ),

            // Values
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 20,
                vertical: isDesktop ? 80 : 40,
              ),
              color: AppColors.lightBg,
              child: Column(
                children: [
                  const Text(
                    'OUR VALUES',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 4,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'What Drives Us',
                    style: TextStyle(
                      fontSize: isDesktop ? 36 : 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkText,
                    ),
                  ),
                  const SizedBox(height: 48),
                  Wrap(
                    spacing: 32,
                    runSpacing: 32,
                    alignment: WrapAlignment.center,
                    children: [
                      _ValueCard(
                        icon: Icons.verified,
                        title: 'Authenticity',
                        desc: 'Every watch is verified by expert horologists',
                      ),
                      _ValueCard(
                        icon: Icons.handshake,
                        title: 'Trust',
                        desc: 'Building lasting relationships with collectors',
                      ),
                      _ValueCard(
                        icon: Icons.star,
                        title: 'Excellence',
                        desc: 'Only the finest timepieces make our collection',
                      ),
                      _ValueCard(
                        icon: Icons.support_agent,
                        title: 'Service',
                        desc: 'Dedicated support throughout your journey',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Team
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 20,
                vertical: isDesktop ? 80 : 40,
              ),
              child: Column(
                children: [
                  const Text(
                    'OUR TEAM',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 4,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Meet the Experts',
                    style: TextStyle(
                      fontSize: isDesktop ? 36 : 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkText,
                    ),
                  ),
                  const SizedBox(height: 48),
                  Wrap(
                    spacing: 32,
                    runSpacing: 32,
                    alignment: WrapAlignment.center,
                    children: const [
                      _TeamMember(
                        name: 'Alexander Laurent',
                        role: 'Founder & CEO',
                        initials: 'AL',
                      ),
                      _TeamMember(
                        name: 'Victoria Chen',
                        role: 'Head of Curation',
                        initials: 'VC',
                      ),
                      _TeamMember(
                        name: 'Marcus Webb',
                        role: 'Master Horologist',
                        initials: 'MW',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SharedFooter(),
          ],
        ),
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _ValueCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 48, color: AppColors.primary),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.greyText,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _TeamMember extends StatelessWidget {
  final String name;
  final String role;
  final String initials;

  const _TeamMember({
    required this.name,
    required this.role,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: AppColors.primary.withOpacity(0.1),
            child: Text(
              initials,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            style: const TextStyle(fontSize: 14, color: AppColors.greyText),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// CONTACT PAGE
// ============================================================================

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;

    return Scaffold(
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SharedNavbar(showBack: true, title: 'CONTACT'),

            // Hero
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 20,
                vertical: isDesktop ? 80 : 50,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.primary, AppColors.primaryDark],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Get in Touch',
                    style: TextStyle(
                      fontSize: isDesktop ? 48 : 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'We\'d love to hear from you',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            // Contact Content
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 20,
                vertical: isDesktop ? 80 : 40,
              ),
              child:
                  isDesktop || isTablet
                      ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Contact Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'CONTACT INFORMATION',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 4,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                _ContactInfoItem(
                                  icon: Icons.location_on_outlined,
                                  title: 'Visit Us',
                                  content:
                                      '123 Luxury Avenue\nNew York, NY 10001',
                                ),
                                const SizedBox(height: 24),
                                _ContactInfoItem(
                                  icon: Icons.phone_outlined,
                                  title: 'Call Us',
                                  content: '+1 (555) 123-4567',
                                ),
                                const SizedBox(height: 24),
                                _ContactInfoItem(
                                  icon: Icons.email_outlined,
                                  title: 'Email Us',
                                  content: 'info@chronoluxe.com',
                                ),
                                const SizedBox(height: 24),
                                _ContactInfoItem(
                                  icon: Icons.access_time,
                                  title: 'Hours',
                                  content:
                                      'Mon - Sat: 10AM - 7PM\nSunday: 12PM - 5PM',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 80),
                          // Contact Form
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(40),
                              decoration: BoxDecoration(
                                color: AppColors.lightBg,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Send us a Message',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.darkText,
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: _buildTextField(
                                            _nameController,
                                            'Name',
                                            Icons.person_outline,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: _buildTextField(
                                            _emailController,
                                            'Email',
                                            Icons.email_outlined,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    _buildTextField(
                                      _subjectController,
                                      'Subject',
                                      Icons.subject,
                                    ),
                                    const SizedBox(height: 20),
                                    _buildTextField(
                                      _messageController,
                                      'Message',
                                      Icons.message_outlined,
                                      maxLines: 5,
                                    ),
                                    const SizedBox(height: 32),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Message sent successfully! (Demo)',
                                              ),
                                              backgroundColor:
                                                  AppColors.success,
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          foregroundColor: AppColors.white,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 18,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              0,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'SEND MESSAGE',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      : Column(
                        children: [
                          // Contact Info Mobile
                          _ContactInfoItem(
                            icon: Icons.location_on_outlined,
                            title: 'Visit Us',
                            content: '123 Luxury Avenue, New York, NY 10001',
                          ),
                          const SizedBox(height: 20),
                          _ContactInfoItem(
                            icon: Icons.phone_outlined,
                            title: 'Call Us',
                            content: '+1 (555) 123-4567',
                          ),
                          const SizedBox(height: 20),
                          _ContactInfoItem(
                            icon: Icons.email_outlined,
                            title: 'Email Us',
                            content: 'info@chronoluxe.com',
                          ),
                          const SizedBox(height: 40),

                          // Form Mobile
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: AppColors.lightBg,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Send us a Message',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  _buildTextField(
                                    _nameController,
                                    'Name',
                                    Icons.person_outline,
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    _emailController,
                                    'Email',
                                    Icons.email_outlined,
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    _subjectController,
                                    'Subject',
                                    Icons.subject,
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    _messageController,
                                    'Message',
                                    Icons.message_outlined,
                                    maxLines: 4,
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Message sent! (Demo)',
                                            ),
                                            backgroundColor: AppColors.success,
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        foregroundColor: AppColors.white,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            0,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'SEND MESSAGE',
                                        style: TextStyle(letterSpacing: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
            ),

            const SharedFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primary),
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.greyText.withOpacity(0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.greyText.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  const _ContactInfoItem({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.darkText,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.greyText,
                height: 1.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
