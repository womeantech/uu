import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: FirstPage(), // Set the first page as home
));

// First Page
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        backgroundColor: const Color(0xFF9775FA),
      ),
      backgroundColor: const Color(0xFF9775FA),
      body: Container(
        alignment: Alignment.topCenter, // Aligns content to the top center
        padding: const EdgeInsets.only(top: 100), // Add padding to move the content down
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use minimum size for the column
          children: [
            const Text(
              'ተናጋሪ አንደበት !', // Text above the image
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20), // Adds space between text and image
            Image.asset(
              'assets/img.png', // Path to your image
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to SecondPage when button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondPage()),
          );
        },
        backgroundColor: const Color(0xFF9775FA),
        child: const Text('click'),
      ),
    );
  }
}

// Second Page

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String? _selectedLanguage; // Variable to hold the selected language
  final List<String> _languages = [
 
    'Amharic',
    'Oromiffa',
    'Tigrinya',
    'Somali',
    'Afar',
    'Hadiyya',
    'Gurage',
    'Sidamo',
    'Welayta',
    'Kambaata',
    'Harari',
    'English',
    'Arabic',
    'Benshangul',
    'Gambela',
    'SNNPR', // Southern Nations, Nationalities, and Peoples' Region
    'Oromo',
    'Other' // Option for other languages
  ]; // List of languages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0), // Adjust padding if necessary
          child: Image.asset(
            'assets/new5.png', // Path to your logo image
            fit: BoxFit.contain,
            width: 100,
            height: 100, // Adjust the logo to fit the space
          ),
        ),
        title: const Text(''),
        centerTitle: true,
        backgroundColor: const Color(0xFF9775FA),
      ),
      backgroundColor: const Color(0xFF9775FA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img.png', // Replace with the correct image path
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 50),

            // Language Selection Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add some padding
              child: DropdownButton<String>(
                value: _selectedLanguage,
                hint: const Text(
                  'Select Language',
                  style: TextStyle(color: Colors.white), // White hint text
                ),
                dropdownColor: const Color(0xFF9775FA), // Dropdown background color
                items: _languages.map((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language, style: const TextStyle(color: Colors.black)), // Black text for items
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue;
                  });
                },
              ),
            ),

            const SizedBox(height: 20), // Space between dropdown and buttons

            // Register Button
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Register Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sign Up Button
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Sign Up Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
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



// Register Page (with earlier design)
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA), // Background color from the design
      resizeToAvoidBottomInset: true, // Prevent bottom overflow when keyboard appears
      body: SingleChildScrollView( // Allows the screen to scroll if the content overflows
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height, // Ensure content fills the screen height
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(20.0), // Padding around the page
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
                children: [
                  const Spacer(), // Pushes content towards the bottom

                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Bold white text
                    ),
                  ),
                  const SizedBox(height: 20.0), // Spacing between the title and fields

                  // Full Name TextField
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8, // Set width to 80% of screen
                    height: 50.0, // Set height of the TextField
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white), // Adjusted border radius
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white), // Dark border color when not focused
                        ),
                        filled: true,
                        fillColor: const Color(0xFF9775FA), // Purple background for the input
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0), // Adjust internal padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Email TextField
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8, // Set width to 80% of screen
                    height: 50.0, // Set height of the TextField
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white), // Adjusted border radius
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white), // Dark border color when not focused
                        ),
                        filled: true,
                        fillColor: const Color(0xFF9775FA), // Purple background for the input
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0), // Adjust internal padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Password TextField
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8, // Set width to 80% of screen
                    height: 50.0, // Set height of the TextField
                    child: TextField(
                      obscureText: true, // Hides the password text
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white), // Adjusted border radius
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white), // Dark border color when not focused
                        ),
                        filled: true,
                        fillColor: const Color(0xFF9775FA), // Purple background for the input
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0), // Adjust internal padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Register Button
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4, // Set width to 40% of screen
                    height: 40.0, // Set button height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Button background color
                        foregroundColor: Colors.black, // Button text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0), // Rounded button edges
                        ),
                      ),
                      onPressed: () {
                        _showRegistrationMessage(context); // Show success message on click
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // Bold text
                          fontSize: 16.0,
                          color: Colors.black, // Text color
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0), // Spacing below the button

                  // Already a Member? Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a Member?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to SignUpPage when 'Login' is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpPage()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Bold text
                            color: Colors.white,
                            shadows: [
                              Shadow( // Add shadow to the text
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(), // Spacer at the bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Method to show the registration success message
  void _showRegistrationMessage(BuildContext context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        right: 20.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.green, // Success message background color
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  offset: Offset(2, 2), // Shadow effect
                ),
              ],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.white), // Check icon
                SizedBox(width: 10.0),
                Text(
                  'Successfully Registered',
                  style: TextStyle(
                    color: Colors.white, // White text
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry); // Show the message

    // Remove the message after 3 seconds and navigate to SignUpPage
    Future.delayed(const Duration(seconds: 1), () {
      overlayEntry.remove();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignUpPage()),
      );
    });
  }
}

// Sign Up Page


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA), // Background color
      resizeToAvoidBottomInset: true, // Prevent bottom overflow
      body: SingleChildScrollView( // Allows the screen to scroll when the keyboard appears
        child: SizedBox(
          height: MediaQuery.of(context).size.height, // Fill the screen height
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0), // Padding around the content
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Bold white text
                      ),
                    ),
                    const SizedBox(height: 20.0), // Spacing between the title and fields

                    // Email TextField
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white), // White border
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white), // Dark border color when not focused
                        ),
                        filled: true,
                        fillColor: const Color(0xFF9775FA), // Purple background
                      ),
                    ),
                    const SizedBox(height: 10.0), // Space between email and password fields

                    // Password TextField
                    TextField(
                      obscureText: true, // Hide password input
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white), // White border
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white), // Dark border color when not focused
                        ),
                        filled: true,
                        fillColor: const Color(0xFF9775FA), // Purple background
                      ),
                    ),
                    const SizedBox(height: 10.0),

                    // Forgot Password and Social Icons
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end, // Align the row to the right
                        children: [
                          // Google Icon
                          IconButton(
                            icon: const Icon(Icons.mail, size: 20.0), // Placeholder for Google icon
                            onPressed: () {
                              // Add Google authentication logic here
                            },
                            color: Colors.white,
                          ),

                          // Instagram Icon
                          IconButton(
                            icon: const Icon(Icons.camera_alt, size: 20.0), // Placeholder for Instagram icon
                            onPressed: () {
                              // Add Instagram authentication logic here
                            },
                            color: Colors.white,
                          ),

                          // Facebook Icon
                          IconButton(
                            icon: const Icon(Icons.facebook, size: 20.0), // Placeholder for Facebook icon
                            onPressed: () {
                              // Add Facebook authentication logic here
                            },
                            color: Colors.white,
                          ),

                          // Forgot Password Link
                          TextButton(
                            onPressed: () {
                              // Handle forgot password action here
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.white, // White text
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0), // Space between password and social buttons

                    // Register/Login Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'New Here?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to the RegisterPage when clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterPage()),
                            );
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              shadows: [
                                Shadow( // Add shadow to the text
                                  offset: Offset(1.0, 1.0),
                                
                                  color: Colors.white,
                                ),
                              ],
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0), // Space between register and login button

                    // Login Button
                    Center(
                      child: SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Button background color
                            foregroundColor: Colors.black, // Button text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0), // Rounded button
                            ),
                          ),
                          onPressed: () {
                            // Login button action here
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              // Navigate to ProfilePage when profile icon is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()), // Change to ProfilePage
              );
            },
            child: ClipOval(
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  'assets/imager.png',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'እኛም አንተም እናንተ !',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Take control of your safety.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20.0),

                // Search Bar
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () {
                        // Action for custom image tap
                      },
                      child: ClipOval(
                        child: Container(
                          color: Colors.white,
                          child: Image.asset(
                            'assets/notify.png',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),

                // Navigation Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to FormPage when the Home button is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FormPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFECD0),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text('Home'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to AboutUsPage when About Us button is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AboutUsPage()), // Change to AboutUsPage
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text('About us'),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),

          // Expanded GridView to fill remaining space
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.8,
              children: [
                _buildFeatureCardWithImage(
                  imagePath: 'assets/report.png',
                  title: 'Report',
                  description: 'Report any accident that you face.',
                  context: context,
                ),
                _buildFeatureCardWithImage(
                  imagePath: 'assets/petition.png',
                  title: 'Petition',
                  description: 'Be a voice for everyone.',
                  context: context,
                ),
                _buildFeatureCardWithImage(
                  imagePath: 'assets/consultancy.png',
                  title: 'Consultancy',
                  description: 'Get help & learn more about your safety.',
                  context: context,
                ),
                _buildFeatureCardWithImage(
                  imagePath: 'assets/forum.png',
                  title: 'Forum',
                  description: 'Share your story and read others.',
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF9775FA),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
        ],
      ),
    );
  }

  // Helper function to build feature cards using images
  Widget _buildFeatureCardWithImage({
    required String imagePath,
    required String title,
    required String description,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        if (title == 'Petition') {
          // Navigate to PetitionPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PetitionPage()),
          );
        } else if (title == 'Report') {
          // Navigate to ReportPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReportPage()),
          );
        } else if (title == 'Consultancy') {
          // Navigate to ConsultancyPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConsultancyPage()),
          );
        } else if (title == 'Forum') {
          // Navigate to ForumPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormPage()), // Update to ForumPage
          );
        }
      },
      child: SizedBox(
        width: 100.0,
        height: 180.0,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 4,
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: 70.0,
                  height: 70.0,
                ),
                const SizedBox(height: 10.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//profile pageflutter run


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF9775FA), // Top purple color
              Color.fromARGB(255, 155, 140, 199), // Faded purple
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF9775FA),
                    size: 60,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Name',
                  style: TextStyle(color: Colors.white),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your name here',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Email',
                  style: TextStyle(color: Colors.white),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email here',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Submit button
                ElevatedButton(
                  onPressed: () {
                    // Add your submit logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9775FA), // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'SAVE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF9775FA),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Warnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}

//consultancy1 page
class ConsultancyPage extends StatelessWidget {
  const ConsultancyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Text - "Together Against Violence"
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Together Against Violence',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.deepOrangeAccent,
                fontFamily: 'Cursive', // Custom font similar to the one in the image
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Main Image Section (Top Women Image)
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/women.png'), // Your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Silhouette Icon and Description Text Section
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: const Color(0xFF9C89F6), // Background color to match the purple area
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img.png', // Replace with your silhouette image
                    height: 100,
                    width: 100,
                    color: Colors.black, // Silhouette color
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Connect with trusted professionals for confidential support.\n'
                      'Get help, Learn and know more about yourself.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextButton(
                          onPressed: () {
                            // Skip button action
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: IconButton(
                          onPressed: () {
                            // Navigate to SupportPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SupportPage()), // Navigating to SupportPage
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Bottom Navigation Bar
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.warning_amber_outlined, color: Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.handshake, color: Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.purple), // Active home icon
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_box_outline_blank, color: Colors.black), // Custom icon
                label: '',
              ),
            ],
            currentIndex: 2, // Home is selected
            onTap: (index) {
              // Handle bottom navigation tap
            },
          ),
        ],
      ),
    );
  }
}
//support for consultancy page
class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA),
      body: Column(
        children: [
          // Top Image Banner
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/consult.png'), // Replace with your header image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Grid Section
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildSupportCard(
                    context,
                    imagePath: 'assets/new2.png', // Replace with your asset image
                    title: 'Past Trauma',
                    onTap: () {
                      // Navigate to TraumaPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TraumaPage()),
                      );
                    },
                  ),
                  _buildSupportCard(
                    context,
                    imagePath: 'assets/new3.png', // Replace with your asset image
                    title: 'Mental Health',
                    onTap: () {
                      // Navigate to MentalHealthPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MentalHealthPage()),
                      );
                    },
                  ),
                  _buildSupportCard(
                    context,
                    imagePath: 'assets/new4.png', // Replace with your asset image
                    title: 'Abuse Recovery',
                    onTap: () {
                      // Navigate to AbuseRecoveryPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AbuseRecoveryPage()),
                      );
                    },
                  ),
                  _buildSupportCard(
                    context,
                    imagePath: 'assets/new.png', // Replace with your asset image
                    title: 'Build your Confidence',
                    onTap: () {
                      // Navigate to ConfidencePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ConfidencePage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Bottom Navigation Bar
          BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF9775FA),
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.warning_amber_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.handshake_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined),
                label: '',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function to build support cards
  Widget _buildSupportCard(
    BuildContext context, {
    required String imagePath,
    required String title,
    required VoidCallback onTap, // Add onTap parameter for click handling
  }) {
    return GestureDetector(
      onTap: onTap, // Trigger the provided onTap callback
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 60,
                height: 60,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//trauma
class TraumaPage extends StatelessWidget {
  const TraumaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA), // Background purple color
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
        elevation: 0, // Remove shadow under the app bar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Add back button functionality
            Navigator.pop(context);
          },
        ),
        title: const Text('Past Trauma',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // What is Trauma? Text
              const Text(
                "What is Trauma?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),

              // Understanding and Healing Section
              const Text(
                "Understanding and Healing",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Trauma refers to the emotional and psychological "
                "response to distressing or life-threatening experiences. "
                "It can manifest in various ways, impacting thoughts, "
                "feelings, and behaviors.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),

              // Watch Video button
              TextButton(
                onPressed: () {
                  // Add your video watch functionality
                },
                child: const Text(
                  'Watch Video',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Introduction to Trauma Image
              Center(
                child: Image.asset(
                  'assets/tt.jpg', // Path to the image
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Types of Trauma
              const Text(
                "Types of Trauma",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  'assets/diff.avif', // Path to the image
                  height: 390,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // The Journey to Healing Section
              const Text(
                "The Journey to Healing",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  'assets/jj.jpg', // Path to the image
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF9775FA),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),

      // Floating Action Button to navigate to the next page (TraumaPage2)
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_forward,
          color: Color(0xFF9775FA),
        ),
        onPressed: () {
          // Navigate to TraumaPage2 when arrow is clicked
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TraumaPage2()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Positioned in the bottom center
    );
  }
}

//trauma2

class TraumaPage2 extends StatelessWidget {
  const TraumaPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA), // Purple background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Introduction to Trauma.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/mm.jpg', // Replace with your image
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '"Welcome to our video on understanding trauma. '
                'Today, we’ll explore what trauma is, how it affects individuals, '
                'particularly survivors of sexual abuse, and why understanding this concept '
                'is crucial for healing and empowerment."',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Comment section header
              const Text(
                "What is Your Idea?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Text(
                "We want to hear from you!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),

              // Comment Input
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Say something...",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 16.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle comment submission
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Comment button color
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text("Comment"),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Sample comments
              _buildComment("Hanna", "It would be helpful to develop resources that include personal stories."),
              const SizedBox(height: 10),
              _buildComment("Abel", "Developing videos around healing methods would be very useful."),
              const SizedBox(height: 10),
              _buildComment("Buna", "This was helpful to understand, it should be shared widely."),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF9775FA),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }

  // Comment widget
  Widget _buildComment(String name, String commentText) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              child: Text(name[0]), // Display the first letter of the name
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    commentText,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//mental health

class MentalHealthPage extends StatelessWidget {
  const MentalHealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA), // Purple background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Mental Health',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Section Title
              const Text(
                'What is Mental Health?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Subtitle Text
              const Text(
                'Vital part of our overall well-being',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Description Text
              const Text(
                'Trauma refers to the emotional and psychological response to a distressing or life-threatening experience. It can manifest in various ways, impacting thoughts, feelings, and behaviors.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Watch Video Section
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle video watching logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button color
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Watch Video"),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Section Image
              Center(
                child: Image.asset(
                  'assets/as.jpg', // Replace with your image path
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Subsections with descriptions
              const Text(
                'Why Mental Health Matters',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: Image.asset(
                  'assets/ma.avif', // Replace with image
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Common Mental Health Challenges',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: Image.asset(
                  'assets/b.jpg', // Replace with image
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Recognizing Signs of Mental Health Issues',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: Image.asset(
                  'assets/brain.jpg', // Replace with image
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF9775FA),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
//abuse recovery
class AbuseRecoveryPage extends StatelessWidget {
  const AbuseRecoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA), // Purple background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Mental Health',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Section Title
              const Text(
                'What is Mental Health?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Subtitle Text
              const Text(
                'Vital part of our overall well-being',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Description Text
              const Text(
                'Trauma refers to the emotional and psychological response to a distressing or life-threatening experience. It can manifest in various ways, impacting thoughts, feelings, and behaviors.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Watch Video Section
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle video watching logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button color
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Watch Video"),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Section Image
              Center(
                child: Image.asset(
                  'assets/abu.jpg', // Replace with your image path
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Subsections with descriptions
              const Text(
                'Why Mental Health Matters',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: Image.asset(
                  'assets/hea.jpg', // Replace with image
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Common Mental Health Challenges',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: Image.asset(
                  'assets/chall.jpg', // Replace with image
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Recognizing Signs of Mental Health Issues',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: Image.asset(
                  'assets/rec.jpg', // Replace with image
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF9775FA),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
//build confidence
class ConfidencePage extends StatelessWidget {
  const ConfidencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA), // Purple background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Mental Health',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Section Title
              const Text(
                'What is Mental Health?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Subtitle Text
              const Text(
                'Vital part of our overall well-being',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Description Text
              const Text(
                'Trauma refers to the emotional and psychological response to a distressing or life-threatening experience. It can manifest in various ways, impacting thoughts, feelings, and behaviors.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Watch Video Section
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle video watching logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button color
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Watch Video"),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Section Image
              Center(
                child: Image.asset(
                  'assets/ss.jpg', // Replace with your image path
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Subsections with descriptions
              const Text(
                'Why Mental Health Matters',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: Image.asset(
                  'assets/well.jpg', // Replace with image
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Common Mental Health Challenges',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: Image.asset(
                  'assets/heal.jpg', // Replace with image
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Recognizing Signs of Mental Health Issues',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: Image.asset(
                  'assets/health.jpg', // Replace with image
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF9775FA),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}

//Forum page
class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum Page'),
        backgroundColor: const Color(0xFF9775FA),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Purple Section with Image
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF9775FA),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Image section (circular avatar)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/prowomen.png'), // Make sure to add the image to assets
                    ),
                    SizedBox(height: 20),
                    // Name and title
                    Text(
                      'Bezawit',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Women Supporter',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Future Plan:\nHobby:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Description section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Text(
                    'Women are the backbone of our societies, carrying immense strength, '
                    'resilience, and wisdom. Despite facing numerous challenges—be it in '
                    'the workplace, at home, or in personal struggles—women continuously '
                    'rise above and show extraordinary courage and determination.\n\n'
                    'Supporting women means fostering environments where they can thrive, '
                    'feel safe, and be empowered to make their own choices. It is about '
                    'celebrating their achievements, amplifying their voices, and ensuring '
                    'equal opportunities in every sphere of life. When women are uplifted and supported, '
                    'families, communities, and entire nations benefit. Believe in yourself!',
                    style: TextStyle(
                      fontSize: 14,
                      color:  Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Left/Right Arrow Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF9775FA)),
                      ),
                      const Text(
                        'Bezawit',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF9775FA),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.purple[800]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Share Information Button
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF9775FA),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Share also your Information\nFeel free',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Bottom Navigation Bar
            const BottomNavigationBarWidget(),
          ],
        ),
      ),
    );
  }
}

// Bottom Navigation Bar Widget
class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Color(0xFF9775FA), size: 30),
            onPressed: () {
              Navigator.pop(context); // Navigate back to HomePage
            },
          ),
          const Icon(Icons.group, color: Color(0xFF9775FA), size: 30),
          const Icon(Icons.message, color: Color(0xFF9775FA), size: 30),
          const Icon(Icons.account_circle, color: Color(0xFF9775FA), size: 30),
        ],
      ),
    );
  }
}
//About us
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFD6C3E4), // #D6C3E4
              Color(0xFF9775FA), // #9775FA
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        'assets/image.png', // Replace with your image asset
                        width: 200, // Adjust width as needed
                        height: 150, // Adjust height as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16), // Space between image and text
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Who are we?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'the platform is a dedicated platform developed by a team of passionate women from Bahir Dar University. ', // Add your full description text here
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'What is our aim?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      '''
Our aim is to:

• Offer easy means for reporting for victims and witnesses of abuse.
• Provide educational resources to raise awareness and inform the public about reporting and preventing abuse.
• Create a supportive community for individuals who have experienced abuse, helping them share their experiences.
• Advocate for stronger collaboration with authorities to ensure the safety of women and children in Ethiopia.

We are more than just development practitioners, we are part of a movement.
                      ''', // Add your full description text here
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF9775FA),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
        ],
      ),
    );
  }
}
//petition1 page

class PetitionPage extends StatelessWidget {
  const PetitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Petition Page 1',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 149, 125, 222),
      body: SingleChildScrollView( // Wrap the body content with SingleChildScrollView
        child: Column(
          children: [
            // Top image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/ass.png', // replace with your image asset path
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Petition title and description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.published_with_changes_outlined,
                    color: Colors.black,
                    size: 40.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Petition',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Protect Ethiopia’s Children and Young People from Sexual Abuse',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Sexual abuse is a widespread issue that affects the most vulnerable members of our society—especially children and young people. In Ethiopia, many cases of sexual abuse go unreported, and survivors are often left without the support they need to heal. We must take urgent action to stop this cycle of abuse.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
            // Skip arrow button
            GestureDetector(
              onTap: () {
                // Navigate to the second petition page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PetitionPageTwo()), // Update to your second petition page
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Icon(
                      Icons.arrow_forward,
                      size: 30.0,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF9775FA),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.recycling),
            label: 'Recycling',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
        ],
      ),
    );
  }
}
//petitionpage2

class PetitionPageTwo extends StatelessWidget {
  const PetitionPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Petition Page 2',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/wom.png', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF9775FA).withOpacity(0.8),  // Top purple color with transparency
                    const Color.fromARGB(255, 155, 140, 199).withOpacity(0.8), // Faded purple with transparency
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Content on top of the background and gradient
          Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/img.png', // Replace with the actual image path
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0), // Space between the image and text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '''We, the undersigned, call upon the Ethiopian government, educational institutions, and law enforcement to:

1. Strengthen legal processes for survivors of sexual abuse.
2. Provide adequate funding for mental health services.
3. Launch educational campaigns on abuse prevention.
4. Create safe reporting mechanisms.''',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF9775FA),
        unselectedItemColor: Colors.black,
        currentIndex: 0, // This can be used to highlight the selected tab
        onTap: (index) {
          if (index == 2) {
            // When the arrow forward is tapped, navigate to PetitionPageThree
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PetitionPageThree()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: '',
          ),
        ],
      ),
    );
  }
}


//petition3
class PetitionPageThree extends StatelessWidget {
  const PetitionPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40.0),
                  // Top Image or Icon
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.person_outline, // Replace with your image if needed
                      size: 100.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Petition Title and Text
                  const Text(
                    'By signing this petition, you are supporting a movement to protect Ethiopia’s children and young people from the trauma of sexual abuse. Together, we can build a safer, more supportive society where no child has to suffer in silence.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40.0),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Petition',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Petition Form (Full Name, Email, Feedback)
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20.0),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20.0),
                  const TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Feedback',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 30.0),
                  // Sign the Petition Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Button color
                        foregroundColor: const Color(0xFF9775FA), // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Sign the Petition',
                          style: TextStyle(
                            color: Color(0xFF9775FA),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Skip Text and Dots Indicator
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Skip',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.circle,
                        size: 10.0,
                        color: Colors.white70,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10.0,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10.0,
                        color: Colors.white70,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 24.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF9775FA),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: '',
          ),
        ],
      ),
    );
  }
}
//report page1

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const SingleChildScrollView( // Wrap the body in SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main introductory paragraph
              Text(
                'Reporting Guidelines and Agreement',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16), // Spacing between paragraphs
              // Intro to the rules
              Text(
                'Be careful as you proceed, please read the guidelines before continuing.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 12),
              // First guideline
              Text(
                '1. Truthfulness: Be as detailed as possible when describing the situation. Provide specific information to help professionals understand the issue better.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 12),
              // Second guideline
              Text(
                '2. Respect for All Parties: Avoid using offensive language or false information. Our goal is to maintain a safe space for everyone, and accurate reporting helps us achieve that.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 12),
              // Third guideline
              Text(
                '3. Privacy and Confidentiality: Respect the privacy of others. Do not share personal information about others unless it is necessary for the report.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 12),
              // Additional guidelines
              Text(
                '4. Openness: If you are uncertain about any information, mention that in your report. Being honest and transparent helps us understand the situation better.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 24),
              // Final paragraph
              Text(
                'By signing this petition, you agree to the terms and conditions outlined in our agreement. This helps us to create a safe, trustworthy platform for everyone.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30), // Space before signature

              // Signature input field
              Text.rich(
                TextSpan(
                  text: 'Signature', // Signature part, bold, purple, and bigger size
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9775FA), // Use your custom purple color
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '(press enter after you put your name):', // Smaller and regular text
                      style: TextStyle(
                        fontSize: 14, // Smaller font size
                        fontWeight: FontWeight.normal, // Normal font weight
                        color: Colors.black, // Set color to black for the rest of the text
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              SignatureInput(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.warning_amber_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.report_gmailerrorred),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 232, 226, 182),
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SignatureInput extends StatefulWidget {
  const SignatureInput({super.key});

  @override
  _SignatureInputState createState() => _SignatureInputState();
}

class _SignatureInputState extends State<SignatureInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String errorMessage = ""; // Variable to store error message

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Show error message if signature is empty
        if (errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 14),
            ),
          ),
        
        // TextField for signature
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: const InputDecoration(
            hintText: 'Type your name as signature',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (String value) {
            if (value.isEmpty) {
              // If the signature is empty, show the error message
              setState(() {
                errorMessage = "Please enter your signature.";
              });
            } else {
              // If signature is not empty, navigate to the next page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NextPage()),
              );
            }
          },
        ),
      ],
    );
  }
}

//reportpage2
class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                'Report',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 8),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Icon(
                Icons.report,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text('First Name', style: TextStyle(fontSize: 18, color: Color(0xFF9775FA))),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your first name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text('Last Name', style: TextStyle(fontSize: 18, color: Color(0xFF9775FA))),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your last name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text('Age', style: TextStyle(fontSize: 18, color: Color(0xFF9775FA))),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your age',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 18),
                  const Text('Gender', style: TextStyle(fontSize: 18, color: Color(0xFF9775FA))),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (bool? value) {}),
                          const Text('Female', style: TextStyle(fontSize: 18, color: Color(0xFF9775FA))),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (bool? value) {}),
                          const Text('Male', style: TextStyle(fontSize: 18, color: Color(0xFF9775FA))),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Location', style: TextStyle(fontSize: 18, color: Color(0xFF9775FA))),
                  const SizedBox(height: 18),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('City', style: TextStyle(fontSize: 18, color: Color(0xFF9775FA))),
                          SizedBox(width: 18),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your city',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Row(
                        children: [
                          Text('Subcity', style: TextStyle(fontSize: 18, color: Color(0xFF9775FA))),
                          SizedBox(width: 18),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your subcity',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Report3()), // Replace with the actual page
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: const Color(0xFF9775FA),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.warning_amber_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.report_gmailerrorred),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 232, 226, 182),
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}



//report page3

class Report3 extends StatelessWidget {
  const Report3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
    Navigator.pop(context); // This will navigate back to the previous page
  },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location of Incident
              const Text(
                'Location of Incident:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
              ),
              const SizedBox(height: 16),
              const TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Street name / Landmark / House / Specific place where the incident happened / Unknown',
                ),
              ),
              const SizedBox(height: 20),

              // Did you know the person/s involved?
              const Text(
                'Did you know the person/s who is involved:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
              ),
              const Row(
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: null),
                      Text('Yes'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: null),
                      Text('No'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // If Yes - Relationship
              const Text(
                'If Yes:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
              ),
              const SizedBox(height: 20),
              const TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Any Relatives / Father / specify the relation with you',
                ),
              ),
              const SizedBox(height: 20),

              // Number of people involved
              const Text(
                'Number of people involved:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: ['Unknown', '1', '2', '3', '4', '5+'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
                hint: const Text('Unknown'),
              ),
              const SizedBox(height: 30),

              // Next button
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9775FA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                   onPressed: () {
                  // Navigate to the next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Report4()),
                  );
                },
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.warning_amber_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.report_gmailerrorred),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 232, 226, 182),
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


  // report4

class Report4 extends StatelessWidget {
  const Report4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Was the perpetrator carrying a weapon',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:Color(0xFF9775FA)),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Yes / NO / Not sure\nspecify the weapon',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            const Text(
              'The perpetrator Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:Color(0xFF9775FA)),
            ),
            const SizedBox(height: 12),
            const Text(
              'Physical Features:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:Color(0xFF9775FA)),
            ),
            const SizedBox(height: 8),
            const Text(
              'Height:',
              style: TextStyle(fontSize: 16,color:Color(0xFF9775FA)),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: '',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Hair Color:',
              style: TextStyle(fontSize: 16,color:Color(0xFF9775FA)),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Bald', child: Text('Bald')),
                DropdownMenuItem(value: 'Black', child: Text('Black')),
                DropdownMenuItem(value: 'Blonde', child: Text('Blonde')),
                DropdownMenuItem(value: 'Brown', child: Text('Brown')),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Noticeable mark:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: 'tattoos / scars / which place',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Vehicles:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:Color(0xFF9775FA)),
            ),
            const SizedBox(height: 8),
            const Text(
              'Model:',
              style: TextStyle(fontSize: 16,color:Color(0xFF9775FA)),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'BMW', child: Text('BMW')),
                DropdownMenuItem(value: 'Toyota', child: Text('Toyota')),
                DropdownMenuItem(value: 'Mercedes', child: Text('Mercedes')),
                DropdownMenuItem(value: 'Ford', child: Text('Ford')),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'License Plate:',
              style: TextStyle(fontSize: 16,color:Color(0xFF9775FA)),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Color:',
              style: TextStyle(fontSize: 16,color:Color(0xFF9775FA)),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Black', child: Text('Black')),
                DropdownMenuItem(value: 'White', child: Text('White')),
                DropdownMenuItem(value: 'Red', child: Text('Red')),
                DropdownMenuItem(value: 'Blue', child: Text('Blue')),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next page
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.warning_amber_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.report_gmailerrorred),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 232, 226, 182),
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


  // report 5
class SuccessPge extends StatelessWidget {
  const SuccessPge({super.key});

  @override
  Widget build(BuildContext context) {
    // Display the success message after the page loads
    Future.delayed(Duration.zero, () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully completed')),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Success Page'),
        backgroundColor: const Color(0xFF9775FA),
      ),
      body: Stack(
        children: [
          const Center(
            child: Text(
              'Welcome to the Success Page!',
              style: TextStyle(fontSize: 24, color: Color(0xFF9775FA)),
            ),
          ),
          
          // Button positioned at the bottom right to navigate to ReportPage6
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to ReportPage6 when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SuccessPae()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[700],
              ),
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}

  //report 6
  class SuccessPae extends StatelessWidget {
  const SuccessPae({super.key});

  @override
  Widget build(BuildContext context) {
    // Display the success message after the page loads
    Future.delayed(Duration.zero, () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully completed')),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Success Page'),
        backgroundColor: Colors.purple[700],
      ),
      body: Center(
        child: Text(
          'Welcome to the Success Page!',
          style: TextStyle(fontSize: 24, color: Colors.purple[700]),
        ),
      ),
    );
  }
}



