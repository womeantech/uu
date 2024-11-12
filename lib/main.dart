import 'package:flutter/material.dart';
import 'dart:async';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
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
              'Her Shield !', // Text above the image
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
    'English',
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
        title: Align(
          alignment: Alignment.centerLeft,
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
        centerTitle: false, // Align title to the left
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
            const SizedBox(height: 50), // Space between dropdown and buttons

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
                        labelText: 'Country',
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
                      obscureText: false, 
                      decoration: InputDecoration(
                        labelText: 'City',
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
                          MaterialPageRoute(builder: (context) => const ForumPage()),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const GoFundMePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 253, 252, 250),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text('GoFund Me'),
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
            MaterialPageRoute(builder: (context) => const petitionpage1()),
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
            MaterialPageRoute(builder: (context) => const ForumPage()), // Update to ForumPage
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
    // Define a GlobalKey for ScaffoldState
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Use the GlobalKey to open the endDrawer
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFF9775FA), Colors.purple.shade100],
                ),
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Your Story'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Your Story page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  ShareStoryPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Donate'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Feedback page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GoFundMePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Petition'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Petition page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const petitionpage1(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Reported'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Reported page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReportPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xFF9775FA),
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.black,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.edit, size: 15, color: Colors.red),
                    onPressed: () {
                      // Handle edit profile picture action
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Emebet Molla',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Addis Ababa, Ethiopia',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Handle log out action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9775FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            child: const Text(
              'Log Out',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUsPage(),
                ),
              );
            },
            child: Container(
              color: const Color(0xFF9775FA),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              child: const Text(
                'About us',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
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
          // Back Arrow Icon Button at the top left
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous page
                },
              ),
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
                    height: 150,
                    width: 150,
                    color: Colors.black, // Silhouette color
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Connect with trusted professionals for confidential support.\n'
                      'Get help, Learn and know more about yourself.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
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
          // Back Arrow Icon Button at the top left
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous page
                },
              ),
            ),
          ),
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8,
                children: [
                  _buildSupportCard(
                    context,
                    imagePath: 'assets/new2.png', // Replace with your asset image
                    title: 'Post Traumatic Stress Disorder(PTSD)',
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
                    title: 'Depression',
                    onTap: () {
                      // Navigate to DepressionPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DepressionPage()),
                      );
                    },
                  ),
                  _buildSupportCard(
                    context,
                    imagePath: 'assets/new4.png', // Replace with your asset image
                    title: 'Anxiety Disorder',
                    onTap: () {
                      // Navigate to AnxietyDisorderPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AnxietyDisorderPage()),
                      );
                    },
                  ),
                  _buildSupportCard(
                    context,
                    imagePath: 'assets/new.png', // Replace with your asset image
                    title: 'Dissociative Disorder',
                    onTap: () {
                      // Navigate to DissociativeDisorderPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DissociativeDisorderPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
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
class TraumaPage extends StatefulWidget {
  const TraumaPage({super.key});

  @override
  _TraumaPageState createState() => _TraumaPageState();
}
class _TraumaPageState extends State<TraumaPage> {
  // Define the YouTube Player Controllers
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = YoutubePlayerController(
      initialVideoId: 'hzSx4rMyVjI', // Replace with your first YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    _controller2 = YoutubePlayerController(
      initialVideoId: 'YOUR_SECOND_VIDEO_ID', // Replace with your second YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA), // Background purple color
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Post Traumatic Stress Disorder',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "What is Trauma?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
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
              // First YouTube Video
              YoutubePlayer(
                controller: _controller1,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.white,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.white,
                  handleColor: Colors.deepOrangeAccent,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Types of Trauma",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              // Second YouTube Video
              YoutubePlayer(
                controller: _controller2,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.white,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.white,
                  handleColor: Colors.deepOrangeAccent,
                ),
              ),
              const SizedBox(height: 20),
              // Add other sections as needed...
            ],
          ),
        ),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_forward,
          color: Color(0xFF9775FA),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PsychiatristListPage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
//Psychiatrist
class Psychiatrist {
  final String name;
  final String title;
  final String workplace;
  final String phone;
  final String email;
  final String bio;
  final String imagePath;

  Psychiatrist({
    required this.name,
    required this.title,
    required this.workplace,
    required this.phone,
    required this.email,
    required this.bio,
    required this.imagePath,
  });
}

class PsychiatristListPage extends StatelessWidget {
  final List<Psychiatrist> psychiatrists = [
    Psychiatrist(
  name: "Dr. Bezawit Sedika",
  title: "Medical Doctor || Psychiatrist",
  workplace: "Lancet Hospital, A.A",
  phone: "+251 911 234 567",
  email: "bezawit@example.com",
  bio: "Experienced psychiatrist specializing in mental health support.",
  imagePath: 'assets/doc2.jpg',
),
Psychiatrist(
  name: "Dr. Samuel Yilma",
  title: "Consultant Psychiatrist",
  workplace: "Addis Ababa General Hospital, A.A",
  phone: "+251 912 345 678",
  email: "samuel@example.com",
  bio: "Providing compassionate care and treatment for mental disorders.",
  imagePath: './assets/doc9.jpg',
),
Psychiatrist(
  name: "Dr. Tigist Alemu",
  title: "Psychiatrist",
  workplace: "Black Lion Hospital, A.A",
  phone: "+251 913 456 789",
  email: "tigist@example.com",
  bio: "Specializes in adolescent and adult psychiatry.",
  imagePath: 'assets/doc2.jpg',
),
Psychiatrist(
  name: "Dr. Biruk Tadesse",
  title: "Psychiatrist",
  workplace: "Bethzatha Hospital, A.A",
  phone: "+251 914 567 890",
  email: "biruk@example.com",
  bio: "Expert in managing anxiety and mood disorders.",
  imagePath: 'assets/doc1.jpg',
),
Psychiatrist(
  name: "Dr. Meron Degu",
  title: "Consultant Psychiatrist",
  workplace: "Hayat Medical Center, A.A",
  phone: "+251 915 678 901",
  email: "meron@example.com",
  bio: "Dedicated to improving mental well-being through holistic treatment.",
  imagePath: 'assets/doc3.jpg',
),
Psychiatrist(
  name: "Dr. Yosef Kebede",
  title: "Psychiatrist",
  workplace: "Myungsung Christian Medical Center, A.A",
  phone: "+251 916 789 012",
  email: "yosef@example.com",
  bio: "Focuses on trauma and stress-related mental health issues.",
  imagePath: 'assets/doc5.jpg',
),
Psychiatrist(
  name: "Dr. Fikirte Solomon",
  title: "Senior Psychiatrist",
  workplace: "Zewditu Memorial Hospital, A.A",
  phone: "+251 917 890 123",
  email: "fikirte@example.com",
  bio: "Experienced in providing mental health care for all age groups.",
  imagePath: 'assets/doc6.jpg',
),
Psychiatrist(
  name: "Dr. Girma Melaku",
  title: "Psychiatrist",
  workplace: "Yekatit 12 Hospital, A.A",
  phone: "+251 918 901 234",
  email: "girma@example.com",
  bio: "Passionate about early intervention in psychiatric conditions.",
  imagePath: 'assets/doc8.jpg',
),
Psychiatrist(
  name: "Dr. Lemlem Abebe",
  title: "Consultant Psychiatrist",
  workplace: "St. Gabriel General Hospital, A.A",
  phone: "+251 919 012 345",
  email: "lemlem@example.com",
  bio: "Specializes in child and adolescent psychiatry.",
  imagePath: 'assets/doc7.jpg',
),
Psychiatrist(
  name: "Dr. Amanuel Wondimu",
  title: "Psychiatrist",
  workplace: "Amanuel Mental Health Specialized Hospital, A.A",
  phone: "+251 920 123 456",
  email: "amanuel@example.com",
  bio: "Expert in psychotic disorders and rehabilitation services.",
  imagePath: 'assets/doc1.jpg',
),
    // Add more psychiatrists here...
  ];

   PsychiatristListPage({super.key});
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
        title: const Text(
          'List of Psychiatrists',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: psychiatrists.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(psychiatrists[index].imagePath),
            ),
            title: Text(
              psychiatrists[index].name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              psychiatrists[index].title,
              style: const TextStyle(color: Colors.white70),
            ),
            iconColor: Colors.white,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Workplace: ${psychiatrists[index].workplace}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Phone: ${psychiatrists[index].phone}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Email: ${psychiatrists[index].email}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Bio: ${psychiatrists[index].bio}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
//Depression
class DepressionPage extends StatefulWidget {
  const DepressionPage({super.key});

  @override
  _DepressionPageState createState() => _DepressionPageState();
}

class _DepressionPageState extends State<DepressionPage> {
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;

  @override
  void initState() {
    super.initState();
    
    _controller1 = YoutubePlayerController(
      initialVideoId: 'VIDEO_ID_1', // Replace with your first YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    
    _controller2 = YoutubePlayerController(
      initialVideoId: 'VIDEO_ID_2', // Replace with your second YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
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
        title: const Text(
          'Depression',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              const Text(
                'What is Depression?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Vital part of our overall well-being',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Depression refers to a mood disorder that causes persistent feelings of sadness and loss of interest. It can significantly impact various aspects of one\'s life.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // First YouTube Video Section
              const Text(
                'Learn More About Depression',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              YoutubePlayer(
                controller: _controller1,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.white,
              ),
              const SizedBox(height: 20),

              // Second YouTube Video Section
              const Text(
                'Tips to Manage Depression',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              YoutubePlayer(
                controller: _controller2,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.white,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      
      // Bottom Navigation Bar
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_forward,
          color: Color(0xFF9775FA),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PsychiatristListPage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

//abuse recovery
class AnxietyDisorderPage extends StatefulWidget {
  const AnxietyDisorderPage({super.key});

  @override
  _AnxietyDisorderPageState createState() => _AnxietyDisorderPageState();
}

class _AnxietyDisorderPageState extends State<AnxietyDisorderPage> {
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;
  @override
  void initState() {
    super.initState();
    
    _controller1 = YoutubePlayerController(
      initialVideoId: 'VIDEO_ID_1', // Replace with your first YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    
    _controller2 = YoutubePlayerController(
      initialVideoId: 'VIDEO_ID_2', // Replace with your second YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

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
        title: const Text(
          'Anxiety Disorder',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
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
                'What is Anxiety Disorder?',
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
                'Anxiety disorder is a mental health condition that involves excessive worry, fear, or nervousness about various aspects of life. It can manifest in various ways, impacting thoughts, feelings, and behaviors.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // First YouTube Video Section
              const Text(
                'Understanding Anxiety Disorders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              YoutubePlayer(
                controller: _controller1,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.white,
              ),
              const SizedBox(height: 20),
              // Second YouTube Video Section
              const Text(
                'Coping Strategies for Anxiety',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              YoutubePlayer(
                controller: _controller2,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.white,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      
      // Bottom Navigation Bar
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_forward,
          color: Color(0xFF9775FA),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PsychiatristListPage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


//build confidence
class DissociativeDisorderPage extends StatefulWidget {
  const DissociativeDisorderPage({super.key});

  @override
  _DissociativeDisorderPageState createState() => _DissociativeDisorderPageState();
}

class _DissociativeDisorderPageState extends State<DissociativeDisorderPage> {
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;

  @override
  void initState() {
    super.initState();

    _controller1 = YoutubePlayerController(
      initialVideoId: 'video_id_1', // Replace with your first video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    _controller2 = YoutubePlayerController(
      initialVideoId: 'video_id_2', // Replace with your second video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
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
        title: const Text('Dissociative Disorder',
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
              const Text(
                'What is Mental Health?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Vital part of our overall well-being',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Trauma refers to the emotional and psychological response to a distressing or life-threatening experience. It can manifest in various ways, impacting thoughts, feelings, and behaviors.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Video: Understanding Dissociative Disorders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              YoutubePlayer(
                controller: _controller1,
                showVideoProgressIndicator: true,
              ),
              const SizedBox(height: 20),
              const Text(
                'Video: Managing Dissociative Disorders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              YoutubePlayer(
                controller: _controller2,
                showVideoProgressIndicator: true,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
            floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_forward,
          color: Color(0xFF9775FA),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PsychiatristListPage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
//Forum page
class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Purple Section with Image and Text Side by Side
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF9775FA),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Circular Image
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/prowomen.png'),
                  ),
                  const SizedBox(width: 20),
                  // Text Info Next to the Image
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bisrat Teshome',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Women Supporter',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Volunter in Human Association',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Description Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Text(
                    'Women are the backbone of our societies, carrying immense strength, resilience, and wisdom. Despite facing numerous challenges—be it in the workplace, at home, or in personal struggles—women continuously rise above and show extraordinary courage and determination. Supporting women means fostering environments where they can thrive, feel safe, and be empowered to make their own choices. It is about celebrating their achievements, amplifying their voices, and ensuring equal opportunities in every sphere of life. When women are uplifted and supported, families, communities, and entire nations benefit. Believe in yourself!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Left/Right Arrow Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context); // Goes back to the previous campaign
                        },
                        icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF9775FA)),
                      ),
                      const Text(
                        'Bezawit\'s Campaign',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF9775FA),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Donate Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ShareStoryPage  ()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF9775FA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Share also your information',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Bottom Navigation Bar (Optional, can add if needed)
          ],
        ),
      ),
    );
  }
}
// share your story

class ShareStoryPage extends StatefulWidget {
  @override
  _ShareStoryPageState createState() => _ShareStoryPageState();
}

class _ShareStoryPageState extends State<ShareStoryPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController storyController = TextEditingController();
  bool isAgreed = false;
  bool isSubmitted = false;

  void _submitStory() {
    setState(() {
      isSubmitted = true;
    });

    // Hide the submission message after 3 seconds
    Timer(Duration(seconds: 3), () {
      setState(() {
        isSubmitted = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Share your story',
          style: TextStyle(
            color: Color(0xFF9775FA),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
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
                  const Text(
                    'Your voice matters. Your story can help others find healing and strength.',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),

                  // Name Field
                  const Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9775FA),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your name',
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Contact Information
                  const Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9775FA),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: contactController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email or phone',
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Story Field
                  const Text(
                    'Your Story',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9775FA),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: storyController,
                    maxLines: 8,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Write your story here...',
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Checkbox Agreement
                  Row(
                    children: [
                      Checkbox(
                        value: isAgreed,
                        onChanged: (bool? value) {
                          setState(() {
                            isAgreed = value ?? false;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'I agree to share my story with Her Shield and understand that it will not be shared publicly without my consent.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF9775FA),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Submit Button
                  Center(
                    child: ElevatedButton(
                      onPressed: isAgreed
                          ? () {
                              _submitStory();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9775FA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Submission confirmation message
          if (isSubmitted)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 16, right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Story submitted!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Montserrat', // Add a custom font for elegance
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        'assets/aa.jpg', // Replace with your image asset
                        width: 160, // Set fixed square size
                        height: 160, // Set fixed square size
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
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Montserrat', // Custom font for subheading
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Our app is dedicated to empowering survivors of gender-based violence and abuse. We aim to give users a voice, offer assistance, and advocate for justice.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'Roboto', // Custom font for body text
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'What is our aim?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Montserrat', // Custom font for subheading
                  ),
                ),
                const SizedBox(height: 8),
                const Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      '''
Our Aim is to:

• Offer easy means for reporting for victims and witnesses of abuse.
• Provide educational resources to raise awareness and inform the public about reporting and preventing abuse.
• Create a supportive community for individuals who have experienced abuse, helping them share their experiences.
• Advocate for stronger collaboration with authorities to ensure the safety of women and children in Ethiopia.

We are more than just development practitioners, we are part of a movement.
                      ''',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Roboto', // Custom font for body text
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Montserrat', // Custom font for subheading
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Email: techsisters@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontFamily: 'Roboto', // Custom font for body text
                  ),
                ),
                const Text(
                  'Phone: +251 965577824',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontFamily: 'Roboto', // Custom font for body text
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
class petitionpage1 extends StatelessWidget {
  const petitionpage1({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the NextPage when the page is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => petitionpage2()),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: const Color(0xFF9775FA),
        ),
        backgroundColor: const Color(0xFF9775FA),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Row with Image and Title
                Row(
                  children: [
                    Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image(
                      image: AssetImage('assets/img.png'), // Replace with the path to your image
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                    // Title in the center
                    Expanded(
                      child: Center(
                        child: Text(
                          'Petition Guidelines',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 19),

                // Intro to the rules (centered)
                Center(
                  child: Text(
                    'To keep our community supportive and impactful, we ask that you follow these guidelines when creating or signing petitions:',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 19),

                // First guideline with bolded first word
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '1. Truthfulness and Respect: ',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      TextSpan(
                        text: 'Please ensure all information is accurate and respectful. Petitions are intended to drive real change, so honest, thoughtful contributions make a big difference.',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 19),

                // Second guideline with bolded first word
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '2. Focus on Positive Change: ',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      TextSpan(
                        text: 'Our petition platform is for promoting safety, justice, and well-being. Petitions should support causes that align with our mission of protecting individuals and promoting equity.',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 19),
                
                // Third guideline with bolded first word
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '3. No Misuse: ',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      TextSpan(
                        text: 'Petitions with false claims or those that violate our terms may be removed to maintain a safe and credible space for everyone.',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                // Final paragraph (centered)
                Center(
                  child: Text(
                    'By participating in this petition platform, you agree to these guidelines and support our commitment to positive, meaningful impact.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
       bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF9775FA),
        unselectedItemColor: Colors.black,
        currentIndex: 0, // This can be used to highlight the selected tab
        onTap: (index) {
          if (index == 2) {
            // When the arrow forward is tapped, navigate to PetitionPage2
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const petitionpage2()),
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
    ),
    );
  }
}
      
  
//petitionpage2


class petitionpage2 extends StatelessWidget {
  const petitionpage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Petition',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 149, 125, 222),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top image with shadow and rounded corners
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Material(
                  elevation: 8.0,
                  shadowColor: Colors.black.withOpacity(0.3),
                  child: Image.asset(
                    'assets/girl.jpg', // Your image path
                    height: 200.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            
            // Main content with rounded card-like sections
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.9),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.verified_user_outlined,
                        color: Colors.purple,
                        size: 50.0,
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'Verified Petition Campaign',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'First, read the verified Petition list of individuals and causes that need support and ensure your contributions make a direct impact.',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'With your support, we can make a difference. Every voice helps bring us closer to our mission. Thank you for standing with us!',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30.0),
                    ],
                  ),
           ),
              ),
            ),
            
            const SizedBox(height: 30.0),
            // Donation button with hover effect (subtle animation)
            ElevatedButton(
              onPressed: () {
                // Navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const storypage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF9775FA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 8,
                shadowColor: Colors.black.withOpacity(0.2),
              ),
              child: const Text(
                'Sign Now',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
class storypage extends StatelessWidget {
  const storypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petition Campaign'),
        backgroundColor: const Color(0xFF9775FA),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Purple Section with Image and Text Side by Side
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF9775FA),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Circular Image
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/prowomen.png'),
                  ),
                  const SizedBox(width: 20),
                  // Text Info Next to the Image
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Heben Dereja',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '7 years old',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Victm',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Description Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Text(
                    'Hello,  my name is Heben Dereje and i was only 7 years old when i was raped and killed by a man which i assume as a Dad. my killer was my neighbor and the owner of the house. he has 3 kids and one of the kid is the same as my age. I t was happened in 25/12/2015 e.c there was none in the house except me, my sister, my aunt and himself. his wife and his kids aren’t there. i was studying and i want to go to toilet and i told my aunt that and went but when i returned he called me and i thought there are his kids and went in but after i get in everything change and he chocked and put sand on my mouth for me not to breath and raped by both organ and killed me.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Left/Right Arrow Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context); // Goes back to the previous campaign
                        },
                        icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF9775FA)),
                      ),
                      const Text(
                        'Heben\'s Campaign',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF9775FA),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const storypage1()),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.purple),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Donate Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PetitionPage3()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF9775FA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Sign To Me !',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Bottom Navigation Bar (Optional, can add if needed)
          ],
        ),
      ),
    );
  }
}
// Next Campaign Page
class storypage1 extends StatelessWidget {
  const storypage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petition Campaign'),
        backgroundColor: const Color(0xFF9775FA),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Purple Section with Image and Text Side by Side
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF9775FA),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Circular Image
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/prowomen.png'),
                  ),
                  const SizedBox(width: 20),
                  // Text Info Next to the Image
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jemila',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '12 years old',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Victm',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Description Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Text(
                    'Hello,  my name is jemile and i was only 12 years old when i was raped and killed by a man which i assume as a Dad. my killer was my neighbor and the owner of the house. he has 3 kids and one of the kid is the same as my age. I t was happened in 25/12/2015 e.c there was none in the house except me, my sister, my aunt and himself. his wife and his kids aren’t there. i was studying and i want to go to toilet and i told my aunt that and went but when i returned he called me and i thought there are his kids and went in but after i get in everything change and he chocked and put sand on my mouth for me not to breath and raped by both organ and killed me.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Left/Right Arrow Buttons
                  const SizedBox(height: 20),
                  // Donate Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PetitionPage3 ()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF9775FA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Sign To Me !',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Bottom Navigation Bar (Optional, can add if needed)
          ],
        ),
      ),
    );
  }
}

//petition3

class PetitionPage3 extends StatelessWidget {
  const PetitionPage3({super.key});

  void _showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Signed!😊"),
          content: const Text("You signed successfully!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wom.png'), // Add your image to assets
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Purple overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 151, 117, 250).withOpacity(0.5), // Light purple overlay
                  const Color.fromARGB(255, 151, 117, 250).withOpacity(0.7), // Darker purple towards bottom
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Back Arrow at the Top Left
          Positioned(
            top: 40, // Position from the top
            left: 20, // Position from the left
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop(); // Navigate to the previous page
              },
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 8), // Space below the back arrow
                // Logo/Icon at the top
                const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 80,
                ),
                const SizedBox(height: 50),
                // Full Name field
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                // Email field
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                // Sign the Petition button
                ElevatedButton(
                  onPressed: () {
                    // Show success message
                    _showSuccessMessage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sign the Petition',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Custom Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.warning, color: Colors.purple),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.purple),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.purple),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: Colors.purple),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.purple),
            label: '',
          ),
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

//report page

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
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReportPage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.report_gmailerrorred),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ConsultancyPage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const petitionpage1()),
                        );
              },
            ),
          ],
        ),
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
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReportPage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.report_gmailerrorred),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ConsultancyPage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const petitionpage1()),
                        );
              },
            ),
          ],
        ),
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
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReportPage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.report_gmailerrorred),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ConsultancyPage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const petitionpage1()),
                        );
              },
            ),
          ],
        ),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
            ),
            const SizedBox(height: 12),
            const Text(
              'Physical Features:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
            ),
            const SizedBox(height: 8),
            const Text(
              'Height:',
              style: TextStyle(fontSize: 16, color: Color(0xFF9775FA)),
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
              style: TextStyle(fontSize: 16, color: Color(0xFF9775FA)),
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
            // Modified "Noticeable Mark" text to purple
            const Text(
              'Noticeable mark:',
              style: TextStyle(fontSize: 16, color: Color(0xFF9775FA)), // purple color
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: 'tattoos / scars / which place',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Vehicles:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
            ),
            const SizedBox(height: 8),
            const Text(
              'Model:',
              style: TextStyle(fontSize: 16, color: Color(0xFF9775FA)),
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
              style: TextStyle(fontSize: 16, color: Color(0xFF9775FA)),
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
              style: TextStyle(fontSize: 16, color: Color(0xFF9775FA)),
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
                  // Navigate to the next page (Example: Report5)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Report5()),
                  );
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
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReportPage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.report_gmailerrorred),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ConsultancyPage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const petitionpage1()),
                        );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

  // report 5
class Report5 extends StatelessWidget {
  const Report5({super.key});

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
              maxLines: 6,
              'other thing you want to describe:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: '',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            const Text(
              'Evidence submission',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
            ),
             const Text(
              
              'Do you have any evidence to submit:',
              style: TextStyle(fontSize: 16, color: Color(0xFF9775FA)), // purple color
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Photos,Videos,messages...',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
             const Text(
    'Would you like help gathering evidence (medical,legal advice):',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
    softWrap: false,  // Prevent text from wrapping to the next line
    overflow: TextOverflow.ellipsis,  // Add ellipsis if text exceeds the available width
  ),
              const Row(
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: null),
                      Text('Yes'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: null),
                      Text('No'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
             const Text(
    'Would you like help gathering evidence (medical,legal advice):',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
    softWrap: false,  // Prevent text from wrapping to the next line
    overflow: TextOverflow.ellipsis,  // Add ellipsis if text exceeds the available width
  ),
              const Row(
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: null),
                      Text('Yes'),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: null),
                      Text('No'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
    'Would you like help gathering evidence (medical,legal advice):',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
    softWrap: false,  // Prevent text from wrapping to the next line
    overflow: TextOverflow.ellipsis,  // Add ellipsis if text exceeds the available width
  ),

              const SizedBox(height: 16),
              const Row(
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: null),
                      Text('Yes'),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: null),
                      Text('No'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
            
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next page (Example: Report5)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SuccessPae()),
                  );
                },
                child: const Text('Nextt'),
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
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReportPage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.report_gmailerrorred),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ConsultancyPage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const petitionpage1()),
                        );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

  //report 6
  
class SuccessPae extends StatefulWidget {
  const SuccessPae({super.key});

  @override
  _SuccessPaeState createState() => _SuccessPaeState();
}

class _SuccessPaeState extends State<SuccessPae> {
  // Variable to hold the selected dropdown value
  String? _selectedOption;

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
              'Current situation',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Would you like help gathering evidence (medical, legal advice):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: null),
                    Text('Yes'),
                  ],
                ),
                SizedBox(width: 40),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: null),
                    Text('No'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Radio button options for choosing one of three options
            const Text(
              'Would you prefer this report to be shared publicly for awareness or feedback:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                ListTile(
                  title: const Text('Yes, anonymously'),
                  leading: Radio<String>(
                    value: 'Yes, anonymously',
                    groupValue: _selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                    activeColor: const Color(0xFF9775FA),
                  ),
                ),
                ListTile(
                  title: const Text('No, Keep private'),
                  leading: Radio<String>(
                    value: 'No, Keep private',
                    groupValue: _selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                    activeColor: const Color(0xFF9775FA),
                  ),
                ),
                ListTile(
                  title: const Text('Yes, but only for whom concerned'),
                  leading: Radio<String>(
                    value: 'Yes, but only for whom concerned',
                    groupValue: _selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                    activeColor: const Color(0xFF9775FA),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Additional Information text
            const Text(
              'Additional information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9775FA)),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Photos, Videos, messages...',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 8),

            // Submit Button to show success message
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Show success message (Snackbar)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Successfully submitted!', style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.green, // Green color for success
                    ),
                  );
                },
                child: const Text('Submit'),
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
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReportPage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.report_gmailerrorred),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ConsultancyPage()),
                        );
              },
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const petitionpage1()),
                        );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to HomePage
                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
        },
        backgroundColor: const Color.fromARGB(255, 232, 226, 182),
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
class GoFundMePage extends StatelessWidget {
  const GoFundMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'GoFundMe',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 149, 125, 222),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top image with shadow and rounded corners
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Material(
                  elevation: 8.0,
                  shadowColor: Colors.black.withOpacity(0.3),
                  child: Image.asset(
                    'assets/ggg.jpg', // Your image path
                    height: 200.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            
            // Main content with rounded card-like sections
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.9),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.verified_user_outlined,
                        color: Colors.purple,
                        size: 50.0,
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        'Verified GoFundMe Campaign',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'First, read the verified GoFundMe list of individuals and causes that need funding and ensure your contributions make a direct impact. It is verified by Women and Human right Association',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'With your support, we can make a difference. Every donation helps bring us closer to our mission. Thank you for standing with us!',
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
              ),
            ),
            
            const SizedBox(height: 30.0),


// Donation button with hover effect (subtle animation)
            ElevatedButton(
              onPressed: () {
                // Navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GoFundMePage2()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF9775FA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 8,
                shadowColor: Colors.black.withOpacity(0.2),
              ),
              child: const Text(
                'Donate Now',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
class GoFundMePage2 extends StatelessWidget {
  const GoFundMePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoFundMe Campaign'),
        backgroundColor: const Color(0xFF9775FA),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Purple Section with Image and Text Side by Side
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF9775FA),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Circular Image
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/prowomen.png'),
                  ),
                  SizedBox(width: 20),
                  // Text Info Next to the Image
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Samiha',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Student',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Victm',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Description Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Text(
                    'I grew up in a small village with limited opportunities. Despite the hardships, I was a bright, curious girl who loved reading and dreamed of becoming a teacher. My parents supported my ambitions, doing all they could to keep me in school, though it was never easy.\n\n'
                    'One evening, on my way home, I was assaulted by someone from my village. That experience shattered my sense of safety and left me feeling voiceless and lost. I was afraid to speak out, terrified that I would be blamed or dismissed. For months, I kept silent, carrying the trauma within me while trying to keep up with my studies.Gradually, I changed. I withdrew from my friends, my grades dropped, and my laughter faded. My mother noticed but didn’t know how to help. Eventually, a teacher I trusted asked me gently if something was wrong. Her kindness gave me the courage to finally open up about what had happened.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Left/Right Arrow Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context); // Goes back to the previous campaign
                        },
                        icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF9775FA)),
                      ),
                      const Text(
                        'Samiha\'s Campaign',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF9775FA),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const GoFundMePage3()),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.purple),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Donate Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GoFundMe3Page()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF9775FA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Donate To Her !',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Bottom Navigation Bar (Optional, can add if needed)
          ],
        ),
      ),
    );
  }
}
//gofund3
class GoFundMePage3 extends StatelessWidget {
  const GoFundMePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoFundMe Campaign'),
        backgroundColor: const Color(0xFF9775FA),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Purple Section with Image and Text Side by Side
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF9775FA),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Circular Image
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/prowomen.png'),
                  ),
                  SizedBox(width: 20),
                  // Text Info Next to the Image
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aliha',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Engineer',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'To be voice',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'I grew up in a close-knit neighborhood, where everyone knew each other, and I felt safe. I had big dreams, hoping one day to make a difference in my community, but life took an unexpected turn. One night, I faced an assault that left me feeling broken, vulnerable, and lost. The pain wasn’t just physical—it tore at my spirit, my sense of security, and my trust in others.For months, I kept it to myself, terrified that people wouldn’t believe me or, worse, would blame me. I became withdrawn, shutting out friends and family. My once-bright future felt distant, and each day was a struggle just to get out of bed. I wanted to forget, but the memory haunted me.One afternoon, a friend noticed my silence and gently asked if I was okay. I tried to brush it off, but something about her genuine concern made me break down. I confided in her, pouring out the fear, shame, and anger I had kept inside. She listened without judgment, reminding me that I was not alone.With her encouragement, I found my way to a support group for survivors like me. Meeting others who had faced similar experiences was a turning point. Through their stories, I began to see hope. With therapy and the support of this newfound community, I started reclaiming my voice and my strength. The journey was hard, filled with moments of doubt and pain, but each day, I felt a little bit stronger.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GoFundMe3Page()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF9775FA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 5,
              ),
              child: const Text(
                'Donate To Aliyah!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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


class GoFundMe3Page extends StatelessWidget {
  const GoFundMe3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9775FA),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const Text(
                    'DONATE',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Full Name TextField
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF9775FA),
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Payment Method TextField
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Payment Method',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF9775FA),
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Account TextField
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Account',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF9775FA),
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Amount TextField
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF9775FA),
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Donate Button
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 40.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      onPressed: () {
                        _showRegistrationMessage(context);
                      },
                      child: const Text(
                        'Donate',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Method to show the story sharing success message
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
              color: Colors.green,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 10.0),
                Text(
                  'You have successfully donated! Thanks!',
                  style: TextStyle(
                    color: Colors.white,
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

    overlay.insert(overlayEntry);

    // Remove the message after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
      Navigator.pop(context);
    });
  }
}
