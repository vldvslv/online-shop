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
      home: const LandingPage(),
    );
  }
}

// ============================================================================
// CONSTANTS
// ============================================================================

class AppColors {
  static const Color primary = Color(0xFF722F37);
  static const Color primaryDark = Color(0xFF4A1C23);
  static const Color gold = Color(0xFFD4AF37);
  static const Color darkText = Color(0xFF1A1A1A);
  static const Color greyText = Color(0xFF555555);
  static const Color lightBg = Color(0xFFF9F7F5);
  static const Color white = Colors.white;
}

// ============================================================================
// LANDING PAGE
// ============================================================================

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            _Navbar(),
            _HeroSection(),
            _FeaturesSection(),
            _ProductsSection(),
            _ShowcaseSection(),
            _StatsSection(),
            _TestimonialsSection(),
            _FaqSection(),
            _CtaSection(),
            _Footer(),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// NAVBAR
// ============================================================================

class _Navbar extends StatelessWidget {
  const _Navbar();

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
          Row(
            children: [
              Icon(Icons.watch_outlined, size: 36, color: AppColors.primary),
              const SizedBox(width: 12),
              Text(
                'CHRONO LUXE',
                style: TextStyle(
                  fontSize: isDesktop ? 24 : 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: AppColors.darkText,
                ),
              ),
            ],
          ),
          if (isDesktop)
            Row(
              children: [
                _NavLink(text: 'Home'),
                const SizedBox(width: 32),
                _NavLink(text: 'Collection'),
                const SizedBox(width: 32),
                _NavLink(text: 'About'),
                const SizedBox(width: 32),
                _NavLink(text: 'Contact'),
                const SizedBox(width: 40),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: AppColors.darkText),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Badge(
                    label: const Text('3'),
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
                  onPressed: () {},
                  icon: Badge(
                    label: const Text('3'),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.darkText,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu, color: AppColors.darkText),
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
  const _NavLink({required this.text});

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
    );
  }
}

// ============================================================================
// HERO SECTION
// ============================================================================

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
                              onPressed: () {},
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
                              onPressed: () {},
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
                    'Discover our exclusive collection of luxury timepieces. Crafted with precision, designed for those who appreciate the art of horology.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.greyText,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 350,
                    child: Image.asset(
                      'assets/images/watch1.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {},
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

// ============================================================================
// FEATURES SECTION
// ============================================================================

class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 80 : 60,
      ),
      color: AppColors.white,
      child:
          isDesktop || isTablet
              ? Row(
                children: const [
                  Expanded(
                    child: _FeatureItem(
                      icon: Icons.verified_outlined,
                      title: 'AUTHENTICITY',
                      description:
                          '100% genuine luxury watches with certificates',
                    ),
                  ),
                  Expanded(
                    child: _FeatureItem(
                      icon: Icons.local_shipping_outlined,
                      title: 'FREE SHIPPING',
                      description: 'Complimentary worldwide express delivery',
                    ),
                  ),
                  Expanded(
                    child: _FeatureItem(
                      icon: Icons.autorenew,
                      title: '30-DAY RETURNS',
                      description: 'Hassle-free returns within 30 days',
                    ),
                  ),
                  Expanded(
                    child: _FeatureItem(
                      icon: Icons.support_agent_outlined,
                      title: '24/7 SUPPORT',
                      description: 'Expert assistance anytime you need',
                    ),
                  ),
                ],
              )
              : Column(
                children: const [
                  _FeatureItem(
                    icon: Icons.verified_outlined,
                    title: 'AUTHENTICITY',
                    description:
                        '100% genuine luxury watches with certificates',
                  ),
                  SizedBox(height: 32),
                  _FeatureItem(
                    icon: Icons.local_shipping_outlined,
                    title: 'FREE SHIPPING',
                    description: 'Complimentary worldwide express delivery',
                  ),
                  SizedBox(height: 32),
                  _FeatureItem(
                    icon: Icons.autorenew,
                    title: '30-DAY RETURNS',
                    description: 'Hassle-free returns within 30 days',
                  ),
                  SizedBox(height: 32),
                  _FeatureItem(
                    icon: Icons.support_agent_outlined,
                    title: '24/7 SUPPORT',
                    description: 'Expert assistance anytime you need',
                  ),
                ],
              ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: AppColors.primary),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: AppColors.darkText,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, color: AppColors.greyText),
        ),
      ],
    );
  }
}

// ============================================================================
// PRODUCTS SECTION
// ============================================================================

class _ProductsSection extends StatelessWidget {
  const _ProductsSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;

    final products = [
      {
        'image': 'assets/images/watch1.jpg',
        'name': 'Patek Philippe Calatrava',
        'price': '\$24,500',
      },
      {
        'image': 'assets/images/watch2.jpg',
        'name': 'Rolex Submariner',
        'price': '\$12,800',
      },
      {
        'image': 'assets/images/watch3.jpg',
        'name': 'Omega Seamaster',
        'price': '\$6,200',
      },
      {
        'image': 'assets/images/watch4.jpg',
        'name': 'Audemars Piguet Royal Oak',
        'price': '\$32,000',
      },
      {
        'image': 'assets/images/watch5.jpg',
        'name': 'Cartier Tank Française',
        'price': '\$8,900',
      },
      {
        'image': 'assets/images/watch6.jpg',
        'name': 'IWC Portugieser',
        'price': '\$9,400',
      },
      {
        'image': 'assets/images/watch7.jpg',
        'name': 'Jaeger-LeCoultre Reverso',
        'price': '\$11,200',
      },
      {
        'image': 'assets/images/watch8.jpg',
        'name': 'Vacheron Constantin',
        'price': '\$28,500',
      },
    ];

    int crossAxisCount = isDesktop ? 4 : (isTablet ? 3 : 2);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
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
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return _ProductCard(
                image: products[index]['image']!,
                name: products[index]['name']!,
                price: products[index]['price']!,
              );
            },
          ),
          const SizedBox(height: 48),
          OutlinedButton(
            onPressed: () {},
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
  final String image;
  final String name;
  final String price;

  const _ProductCard({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
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
                    child: Image.asset(widget.image, fit: BoxFit.contain),
                  ),
                  if (_isHovered)
                    Positioned(
                      bottom: 12,
                      left: 12,
                      right: 12,
                      child: ElevatedButton(
                        onPressed: () {},
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
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
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

// ============================================================================
// SHOWCASE SECTION
// ============================================================================

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
                        const SizedBox(height: 24),
                        const Text(
                          'Our master watchmakers spend hundreds of hours perfecting each piece, ensuring that your watch is not just an accessory, but a legacy to be passed down through generations.',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.greyText,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            _ShowcaseStat(
                              number: '150+',
                              label: 'Years Heritage',
                            ),
                            const SizedBox(width: 48),
                            _ShowcaseStat(
                              number: '50+',
                              label: 'Master Craftsmen',
                            ),
                            const SizedBox(width: 48),
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
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/images/watch9.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Each timepiece in our collection represents generations of horological expertise. From the intricate movements to the finest materials, every detail is crafted to perfection.',
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

// ============================================================================
// STATS SECTION
// ============================================================================

class _StatsSection extends StatelessWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 800 && screenWidth <= 1200;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
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
          isDesktop || isTablet
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _StatItem(number: '10,000+', label: 'Happy Customers'),
                  _StatItem(number: '500+', label: 'Luxury Watches'),
                  _StatItem(number: '50+', label: 'Premium Brands'),
                  _StatItem(number: '25+', label: 'Years Experience'),
                ],
              )
              : Column(
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _StatItem(number: '10,000+', label: 'Happy Customers'),
                      _StatItem(number: '500+', label: 'Luxury Watches'),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _StatItem(number: '50+', label: 'Premium Brands'),
                      _StatItem(number: '25+', label: 'Years Experience'),
                    ],
                  ),
                ],
              ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;

  const _StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.white.withOpacity(0.8),
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// TESTIMONIALS SECTION
// ============================================================================

class _TestimonialsSection extends StatelessWidget {
  const _TestimonialsSection();

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
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: _TestimonialCard(
                      text:
                          'Exceptional service and an incredible selection. Found my dream Patek Philippe here. The authentication process gave me complete peace of mind.',
                      author: 'James Morrison',
                      role: 'CEO, Tech Innovations',
                      rating: 5,
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: _TestimonialCard(
                      text:
                          'The attention to detail is remarkable. From browsing to delivery, every step was handled with utmost professionalism. Highly recommended!',
                      author: 'Sarah Chen',
                      role: 'Investment Banker',
                      rating: 5,
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: _TestimonialCard(
                      text:
                          'I\'ve purchased three watches from Chrono Luxe. Each time, the experience has been flawless. They truly understand luxury service.',
                      author: 'Michael Roberts',
                      role: 'Collector',
                      rating: 5,
                    ),
                  ),
                ],
              )
              : Column(
                children: const [
                  _TestimonialCard(
                    text:
                        'Exceptional service and an incredible selection. Found my dream Patek Philippe here. The authentication process gave me complete peace of mind.',
                    author: 'James Morrison',
                    role: 'CEO, Tech Innovations',
                    rating: 5,
                  ),
                  SizedBox(height: 24),
                  _TestimonialCard(
                    text:
                        'The attention to detail is remarkable. From browsing to delivery, every step was handled with utmost professionalism.',
                    author: 'Sarah Chen',
                    role: 'Investment Banker',
                    rating: 5,
                  ),
                  SizedBox(height: 24),
                  _TestimonialCard(
                    text:
                        'I\'ve purchased three watches from Chrono Luxe. Each time, the experience has been flawless. They truly understand luxury service.',
                    author: 'Michael Roberts',
                    role: 'Collector',
                    rating: 5,
                  ),
                ],
              ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String text;
  final String author;
  final String role;
  final int rating;

  const _TestimonialCard({
    required this.text,
    required this.author,
    required this.role,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              rating,
              (index) =>
                  const Icon(Icons.star, color: AppColors.gold, size: 20),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.greyText,
              height: 1.7,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: Text(
                  author[0],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkText,
                    ),
                  ),
                  Text(
                    role,
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
    );
  }
}

// ============================================================================
// FAQ SECTION
// ============================================================================

class _FaqSection extends StatelessWidget {
  const _FaqSection();

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
            child: const Column(
              children: [
                _FaqItem(
                  question: 'Are all watches authentic?',
                  answer:
                      'Yes, every watch we sell is 100% authentic and comes with original documentation, certificates of authenticity, and our own guarantee. We work directly with authorized dealers and verified collectors.',
                ),
                _FaqItem(
                  question: 'What is your return policy?',
                  answer:
                      'We offer a 30-day return policy for all unworn watches in their original condition. Simply contact our customer service team to initiate a return. Full refunds are processed within 5-7 business days.',
                ),
                _FaqItem(
                  question: 'Do you offer international shipping?',
                  answer:
                      'Yes, we ship worldwide. All orders are fully insured and shipped via secure express courier. Delivery typically takes 2-5 business days depending on your location.',
                ),
                _FaqItem(
                  question: 'Do you provide warranty?',
                  answer:
                      'All new watches come with the manufacturer\'s warranty. Pre-owned watches include our own 2-year warranty covering mechanical defects. Extended warranty options are also available.',
                ),
                _FaqItem(
                  question: 'Can I trade in my current watch?',
                  answer:
                      'Absolutely! We offer competitive trade-in values for luxury timepieces. Contact us with details about your watch, and our experts will provide a valuation within 24 hours.',
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
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        border: Border.all(color: Colors.transparent),
      ),
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

// ============================================================================
// CTA SECTION
// ============================================================================

class _CtaSection extends StatelessWidget {
  const _CtaSection();

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
            'Be the first to know about new arrivals, exclusive offers, and private sales',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Row(
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
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
// FOOTER
// ============================================================================

class _Footer extends StatelessWidget {
  const _Footer();

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
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            _SocialIcon(icon: Icons.facebook),
                            const SizedBox(width: 16),
                            _SocialIcon(icon: Icons.camera_alt_outlined),
                            const SizedBox(width: 16),
                            _SocialIcon(icon: Icons.alternate_email),
                          ],
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
                        _FooterLink(text: 'Home'),
                        _FooterLink(text: 'Collection'),
                        _FooterLink(text: 'About Us'),
                        _FooterLink(text: 'Contact'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CUSTOMER SERVICE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _FooterLink(text: 'Shipping Info'),
                        _FooterLink(text: 'Returns'),
                        _FooterLink(text: 'FAQ'),
                        _FooterLink(text: 'Privacy Policy'),
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
                          '+1 (555) 123-4567',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.white.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 4),
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
                    'Curating the world\'s finest timepieces for discerning collectors since 1998.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white.withOpacity(0.7),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _SocialIcon(icon: Icons.facebook),
                      const SizedBox(width: 16),
                      _SocialIcon(icon: Icons.camera_alt_outlined),
                      const SizedBox(width: 16),
                      _SocialIcon(icon: Icons.alternate_email),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    '+1 (555) 123-4567',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 4),
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

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  const _SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(icon, size: 18, color: AppColors.white),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String text;
  const _FooterLink({required this.text});

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
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 14,
            color:
                _isHovered ? AppColors.white : AppColors.white.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
