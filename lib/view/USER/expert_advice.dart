// // // // import 'package:flutter/material.dart';
// // // // import 'package:url_launcher/url_launcher.dart';

// // // // class ExpertAdvicePage extends StatelessWidget {
// // // //   ExpertAdvicePage({super.key});

// // // //   final List<Map<String, String>> therapists = [
// // // //     {
// // // //       "name": "Dr. Shefali Batra",
// // // //       "specialization": "Psychiatrist & CBT Therapist",
// // // //       "city": "Mumbai",
// // // //       "rating": "4.8",
// // // //       "reviews": "520",
// // // //       "image":
// // // //           "https://images.unsplash.com/photo-1559839734-2b71ea197ec2",
// // // //       "phone": "+919876543210",
// // // //       "profile":
// // // //           "https://www.linkedin.com/in/shefalibatra/"
// // // //     },
// // // //     {
// // // //       "name": "Dr. Samir Parikh",
// // // //       "specialization": "Mental Health Specialist",
// // // //       "city": "Delhi",
// // // //       "rating": "4.7",
// // // //       "reviews": "430",
// // // //       "image":
// // // //           "https://images.unsplash.com/photo-1622253692010-333f2da6031d",
// // // //       "phone": "+919812345678",
// // // //       "profile":
// // // //           "https://en.wikipedia.org/wiki/Samir_Parikh"
// // // //     },
// // // //     {
// // // //       "name": "Dr. Vikas Jain",
// // // //       "specialization": "Clinical Psychologist",
// // // //       "city": "Pune",
// // // //       "rating": "4.6",
// // // //       "reviews": "280",
// // // //       "image":
// // // //           "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d",
// // // //       "phone": "+919845612378",
// // // //       "profile":
// // // //           "https://www.linkedin.com/"
// // // //     },
// // // //     {
// // // //       "name": "Dr. Shyam Bhat",
// // // //       "specialization": "Psychiatrist & Mindfulness Expert",
// // // //       "city": "Bangalore",
// // // //       "rating": "4.9",
// // // //       "reviews": "610",
// // // //       "image":
// // // //           "https://images.unsplash.com/photo-1594824476967-48c8b964273f",
// // // //       "phone": "+919999999999",
// // // //       "profile":
// // // //           "https://en.wikipedia.org/wiki/Shyam_Bhat"
// // // //     }
// // // //   ];

// // // //   void launchURL(String url) async {
// // // //     final Uri uri = Uri.parse(url);
// // // //     if (!await launchUrl(uri)) {
// // // //       throw 'Could not launch $url';
// // // //     }
// // // //   }

// // // //   void callDoctor(String phone) async {
// // // //     final Uri uri = Uri.parse("tel:$phone");
// // // //     if (!await launchUrl(uri)) {
// // // //       throw 'Could not call $phone';
// // // //     }
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: const Color(0xffF4F7F9),
// // // //       appBar: AppBar(
// // // //         title: const Text("Expert Advice"),
// // // //         backgroundColor: const Color(0xff6C9BCF),
// // // //         elevation: 0,
// // // //       ),
// // // //       body: ListView.builder(
// // // //         padding: const EdgeInsets.all(16),
// // // //         itemCount: therapists.length,
// // // //         itemBuilder: (context, index) {
// // // //           final doctor = therapists[index];

// // // //           return Container(
// // // //             margin: const EdgeInsets.only(bottom: 20),
// // // //             padding: const EdgeInsets.all(16),
// // // //             decoration: BoxDecoration(
// // // //               color: Colors.white,
// // // //               borderRadius: BorderRadius.circular(18),
// // // //               boxShadow: [
// // // //                 BoxShadow(
// // // //                   color: Colors.black12,
// // // //                   blurRadius: 8,
// // // //                   offset: Offset(0, 4),
// // // //                 )
// // // //               ],
// // // //             ),
// // // //             child: Column(
// // // //               children: [
// // // //                 Row(
// // // //                   children: [
// // // //                     CircleAvatar(
// // // //                       radius: 35,
// // // //                       backgroundImage:
// // // //                           NetworkImage(doctor["image"]!),
// // // //                     ),
// // // //                     const SizedBox(width: 15),

// // // //                     Expanded(
// // // //                       child: Column(
// // // //                         crossAxisAlignment:
// // // //                             CrossAxisAlignment.start,
// // // //                         children: [
// // // //                           Text(
// // // //                             doctor["name"]!,
// // // //                             style: const TextStyle(
// // // //                                 fontSize: 18,
// // // //                                 fontWeight: FontWeight.bold),
// // // //                           ),

// // // //                           const SizedBox(height: 4),

// // // //                           Text(
// // // //                             doctor["specialization"]!,
// // // //                             style: const TextStyle(
// // // //                                 color: Colors.grey),
// // // //                           ),

// // // //                           const SizedBox(height: 4),

// // // //                           Text(
// // // //                             doctor["city"]!,
// // // //                             style: const TextStyle(
// // // //                                 color: Colors.grey),
// // // //                           ),

// // // //                           const SizedBox(height: 6),

// // // //                           Row(
// // // //                             children: [
// // // //                               const Icon(Icons.star,
// // // //                                   color: Colors.orange,
// // // //                                   size: 18),

// // // //                               const SizedBox(width: 4),

// // // //                               Text(
// // // //                                   doctor["rating"]!),

// // // //                               const SizedBox(width: 6),

// // // //                               Text(
// // // //                                 "(${doctor["reviews"]} reviews)",
// // // //                                 style: const TextStyle(
// // // //                                     color: Colors.grey),
// // // //                               )
// // // //                             ],
// // // //                           )
// // // //                         ],
// // // //                       ),
// // // //                     )
// // // //                   ],
// // // //                 ),

// // // //                 const SizedBox(height: 15),

// // // //                 Row(
// // // //                   mainAxisAlignment:
// // // //                       MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     ElevatedButton.icon(
// // // //                       style: ElevatedButton.styleFrom(
// // // //                           backgroundColor:
// // // //                               Colors.green),
// // // //                       icon: const Icon(Icons.call),
// // // //                       label: const Text("Call"),
// // // //                       onPressed: () =>
// // // //                           callDoctor(doctor["phone"]!),
// // // //                     ),

// // // //                     ElevatedButton.icon(
// // // //                       style: ElevatedButton.styleFrom(
// // // //                           backgroundColor:
// // // //                               Colors.blue),
// // // //                       icon: const Icon(Icons.person),
// // // //                       label: const Text("Profile"),
// // // //                       onPressed: () =>
// // // //                           launchURL(doctor["profile"]!),
// // // //                     ),

// // // //                     ElevatedButton.icon(
// // // //                       style: ElevatedButton.styleFrom(
// // // //                           backgroundColor:
// // // //                               Colors.purple),
// // // //                       icon:
// // // //                           const Icon(Icons.calendar_today),
// // // //                       label:
// // // //                           const Text("Book"),
// // // //                       onPressed: () {
// // // //                         ScaffoldMessenger.of(context)
// // // //                             .showSnackBar(
// // // //                           SnackBar(
// // // //                             content: Text(
// // // //                                 "Appointment request sent to ${doctor["name"]}"),
// // // //                           ),
// // // //                         );
// // // //                       },
// // // //                     ),
// // // //                   ],
// // // //                 )
// // // //               ],
// // // //             ),
// // // //           );
// // // //         },
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:url_launcher/url_launcher.dart'; // for opening external links

// // // // // class ExpertAdvicePage extends StatelessWidget {
// // // // //   const ExpertAdvicePage({super.key});

// // // // //   // Sample YouTube links
// // // // //   final List<Map<String, String>> videoAdvice = const [
// // // // //     {
// // // // //       "title": "Mindfulness Meditation for Beginners",
// // // // //       "url": "https://www.youtube.com/watch?v=inpok4MKVLM"
// // // // //     },
// // // // //     {
// // // // //       "title": "Stress Management Tips by Therapist",
// // // // //       "url": "https://www.youtube.com/watch?v=hnpQrMqDoqE"
// // // // //     },
// // // // //   ];

// // // // //   // Sample Q&A
// // // // //   final List<Map<String, String>> qaList = const [
// // // // //     {
// // // // //       "question": "How can I manage anxiety before sleep?",
// // // // //       "answer":
// // // // //           "Practice deep breathing, meditation, or write down your thoughts in a journal before sleeping."
// // // // //     },
// // // // //     {
// // // // //       "question": "What to do when work stress is overwhelming?",
// // // // //       "answer":
// // // // //           "Take short breaks, prioritize tasks, and talk to a friend or counselor to relieve pressure."
// // // // //     },
// // // // //   ];

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: const Text("Expert Advice"),
// // // // //         backgroundColor: Colors.deepPurple,
// // // // //       ),
// // // // //       body: SingleChildScrollView(
// // // // //         padding: const EdgeInsets.all(16),
// // // // //         child: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             const Text(
// // // // //               "💡 Mental Health Tips",
// // // // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             const SizedBox(height: 10),
// // // // //             _buildTipCard("5 Ways to Manage Stress at Work"),
// // // // //             _buildTipCard("Daily Mindfulness Practices"),
// // // // //             _buildTipCard("Handling Anxiety Before Sleep"),
// // // // //             const SizedBox(height: 20),
// // // // //             const Text(
// // // // //               "🎥 Video Advice",
// // // // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             const SizedBox(height: 10),
// // // // //             ...videoAdvice.map((video) => _buildVideoCard(video["title"]!, video["url"]!)),
// // // // //             const SizedBox(height: 20),
// // // // //             const Text(
// // // // //               "❓ Q&A",
// // // // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             const SizedBox(height: 10),
// // // // //             ...qaList.map((qa) => _buildQACard(qa["question"]!, qa["answer"]!)),
// // // // //             const SizedBox(height: 30),
// // // // //             Center(
// // // // //               child: ElevatedButton(
// // // // //                 onPressed: () async {
// // // // //                   const url = 'https://www.mentalhealth.gov/get-help'; // Example link
// // // // //                   if (await canLaunchUrl(Uri.parse(url))) {
// // // // //                     await launchUrl(Uri.parse(url));
// // // // //                   } else {
// // // // //                     ScaffoldMessenger.of(context).showSnackBar(
// // // // //                       const SnackBar(content: Text("Could not open link")),
// // // // //                     );
// // // // //                   }
// // // // //                 },
// // // // //                 style: ElevatedButton.styleFrom(
// // // // //                   backgroundColor: Colors.redAccent,
// // // // //                   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
// // // // //                   shape: RoundedRectangleBorder(
// // // // //                     borderRadius: BorderRadius.circular(12),
// // // // //                   ),
// // // // //                 ),
// // // // //                 child: const Text(
// // // // //                   "Feeling stressed? Contact a professional",
// // // // //                   style: TextStyle(fontSize: 16),
// // // // //                   textAlign: TextAlign.center,
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildTipCard(String text) {
// // // // //     return Card(
// // // // //       margin: const EdgeInsets.symmetric(vertical: 6),
// // // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // // // //       color: Colors.deepPurple.shade50,
// // // // //       child: Padding(
// // // // //         padding: const EdgeInsets.all(12),
// // // // //         child: Text(
// // // // //           text,
// // // // //           style: const TextStyle(fontSize: 16),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildVideoCard(String title, String url) {
// // // // //     return Card(
// // // // //       margin: const EdgeInsets.symmetric(vertical: 6),
// // // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // // // //       child: ListTile(
// // // // //         leading: const Icon(Icons.play_circle_fill, color: Colors.redAccent),
// // // // //         title: Text(title),
// // // // //         trailing: const Icon(Icons.open_in_new),
// // // // //         onTap: () async {
// // // // //           if (await canLaunchUrl(Uri.parse(url))) {
// // // // //             await launchUrl(Uri.parse(url));
// // // // //           }
// // // // //         },
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildQACard(String question, String answer) {
// // // // //     return Card(
// // // // //       margin: const EdgeInsets.symmetric(vertical: 6),
// // // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // // // //       color: Colors.deepPurple.shade50,
// // // // //       child: ExpansionTile(
// // // // //         title: Text(
// // // // //           question,
// // // // //           style: const TextStyle(fontWeight: FontWeight.bold),
// // // // //         ),
// // // // //         children: [
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.all(12),
// // // // //             child: Text(answer),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:url_launcher/url_launcher.dart';

// // // class ExpertAdvicePage extends StatelessWidget {
// // //   ExpertAdvicePage({super.key});

// // //   final List<Map<String, String>> therapists = [
// // //     {
// // //       "name": "Dr. Rohan Jahagirdar",
// // //       "specialization": "Consultant Psychiatrist",
// // //       "city": "Pune",
// // //       "rating": "4.8",
// // //       "reviews": "Public profile available",
// // //       "image":
// // //           "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?auto=format&fit=crop&w=500&q=80",
// // //       "phone": "+919881123006",
// // //       "profile": "https://www.linkedin.com/in/dr-rohan-jahagirdar-75784338",
// // //       "clinic":
// // //           "Aditya Birla Memorial Hospital / MJM Hospital / Cloudnine / Jehangir Hospital",
// // //       "details":
// // //           "Public profile lists anxiety, stress management, depression, substance use and other psychiatric care in Pune.",
// // //       "appointment":
// // //           "Aditya Birla: 9881123006, MJM: 020-41499999, Jehangir: 020-66819999",
// // //     },
// // //     {
// // //       "name": "Dr. Sachin Dhanwade",
// // //       "specialization": "Consultant Psychiatrist",
// // //       "city": "Kharadi, Pune",
// // //       "rating": "5.0",
// // //       "reviews": "Clinic website available",
// // //       "image":
// // //           "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&w=500&q=80",
// // //       "phone": "+918329022350",
// // //       "profile": "https://www.mindfulpsychiatryclinics.in",
// // //       "clinic": "The Mindful Psychiatry Clinic, Kharadi",
// // //       "details":
// // //           "Website lists treatment for anxiety, depression, stress-related disorders, sleep issues, OCD, ADHD and more.",
// // //       "appointment":
// // //           "Mon-Sat: 10:00 AM-1:30 PM, 6:00 PM-9:00 PM | Call: +91 8329022350",
// // //     },
// // //     {
// // //       "name": "Mrs. Swapna M Nadgauda",
// // //       "specialization": "Psychologist",
// // //       "city": "Sanpada, Navi Mumbai",
// // //       "rating": "Experienced",
// // //       "reviews": "31 Years Exp.",
// // //       "image":
// // //           "https://images.unsplash.com/photo-1594824476967-48c8b964273f?auto=format&fit=crop&w=500&q=80",
// // //       "phone": "",
// // //       "profile": "https://www.lybrate.com/navi-mumbai/psychologist",
// // //       "clinic": "Healing Touch Counselling Centre",
// // //       "details":
// // //           "Public directory listing shows psychologist profile, consultation fee and appointment availability in Navi Mumbai.",
// // //       "appointment": "See timings and booking availability on profile listing",
// // //     },
// // //     {
// // //       "name": "Dr. Neha Achrekar",
// // //       "specialization": "Psychologist / Counselling",
// // //       "city": "Navi Mumbai",
// // //       "rating": "Experienced",
// // //       "reviews": "30 Years Exp.",
// // //       "image":
// // //           "https://images.unsplash.com/photo-1622253692010-333f2da6031d?auto=format&fit=crop&w=500&q=80",
// // //       "phone": "",
// // //       "profile": "https://www.lybrate.com/navi-mumbai/psychologist",
// // //       "clinic": "Dr Neha Counselling Center",
// // //       "details":
// // //           "Public directory listing shows profile, clinic consultation fee and appointment availability.",
// // //       "appointment":
// // //           "Check listed timings and booking options on the profile page",
// // //     },
// // //     {
// // //       "name": "Dr. Ajay Balki",
// // //       "specialization": "Psychiatrist",
// // //       "city": "Nerul, Navi Mumbai",
// // //       "rating": "4.9",
// // //       "reviews": "324 Ratings",
// // //       "image":
// // //           "https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=crop&w=500&q=80",
// // //       "phone": "+917487013468",
// // //       "profile":
// // //           "https://www.justdial.com/Mumbai/Psychiatrists-For-Stress-for-Mental-Health/nct-11956656-att-hos1074",
// // //       "clinic": "Nerul West, Navi Mumbai",
// // //       "details":
// // //           "Public listing shows psychiatrist, consultation fee, WhatsApp/contact option and appointment-related listing details.",
// // //       "appointment":
// // //           "Available via listed profile/contact page | Phone: 7487013468",
// // //     },
// // //     {
// // //       "name": "Dr. Vinita Pawar",
// // //       "specialization": "Psychiatrist",
// // //       "city": "Borivali East, Mumbai",
// // //       "rating": "4.6",
// // //       "reviews": "52 Ratings",
// // //       "image":
// // //           "https://images.unsplash.com/photo-1651008376811-b90baee60c1f?auto=format&fit=crop&w=500&q=80",
// // //       "phone": "+918511315406",
// // //       "profile":
// // //           "https://www.justdial.com/Mumbai/Psychiatrists-For-Stress-for-Mental-Health/nct-11956656-att-hos1074",
// // //       "clinic": "S V Road, Borivali East, Mumbai",
// // //       "details":
// // //           "Public listing shows psychiatrist profile, verified listing, contact number and consultation fee.",
// // //       "appointment": "Check profile/contact listing | Phone: 8511315406",
// // //     },
// // //     {
// // //       "name": "Dr. Shruti Tagde",
// // //       "specialization": "Psychiatrist",
// // //       "city": "Dadar West, Mumbai",
// // //       "rating": "4.8",
// // //       "reviews": "40 Ratings",
// // //       "image":
// // //           "https://images.unsplash.com/photo-1582750433449-648ed127bb54?auto=format&fit=crop&w=500&q=80",
// // //       "phone": "+918123860973",
// // //       "profile":
// // //           "https://www.justdial.com/Mumbai/Psychiatrists-For-Stress-for-Mental-Health/nct-11956656-att-hos1074",
// // //       "clinic": "Dadar West, Mumbai",
// // //       "details":
// // //           "Public listing shows psychiatrist profile, contact number and appointment-related listing details.",
// // //       "appointment": "Opens at 5:00 PM on listed page | Phone: 8123860973",
// // //     },
// // //     {
// // //       "name": "Dr. Sushil Deshmukh",
// // //       "specialization":
// // //           "Consultant Psychiatrist, Neuropsychiatrist, Addiction Specialist",
// // //       "city": "Pune",
// // //       "rating": "Professional profile",
// // //       "reviews": "LinkedIn available",
// // //       "image":
// // //           "https://images.unsplash.com/photo-1614436163996-25cee5f54290?auto=format&fit=crop&w=500&q=80",
// // //       "phone": "",
// // //       "profile": "https://www.linkedin.com/in/dr-sushil-deshmukh-93581b154",
// // //       "clinic":
// // //           "Apollo Spectra / Sathe Hospital / Joshi Hospital / Health Point Polyclinic",
// // //       "details":
// // //           "LinkedIn profile lists current psychiatric practice locations in Pune.",
// // //       "appointment":
// // //           "Visit profile and hospital pages for current appointment routing",
// // //     },
// // //   ];

// // //   Future<void> launchURL(String url) async {
// // //     final Uri uri = Uri.parse(url);
// // //     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
// // //       throw 'Could not launch $url';
// // //     }
// // //   }

// // //   Future<void> callDoctor(String phone) async {
// // //     if (phone.trim().isEmpty) return;
// // //     final Uri uri = Uri.parse("tel:$phone");
// // //     if (!await launchUrl(uri)) {
// // //       throw 'Could not call $phone';
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: const Color(0xffF4F7F9),
// // //       appBar: AppBar(
// // //         title: const Text("Expert Advice"),
// // //         backgroundColor: const Color(0xff6C9BCF),
// // //         elevation: 0,
// // //       ),
// // //       body: ListView.builder(
// // //         padding: const EdgeInsets.all(16),
// // //         itemCount: therapists.length,
// // //         itemBuilder: (context, index) {
// // //           final doctor = therapists[index];

// // //           return Container(
// // //             margin: const EdgeInsets.only(bottom: 20),
// // //             padding: const EdgeInsets.all(16),
// // //             decoration: BoxDecoration(
// // //               color: Colors.white,
// // //               borderRadius: BorderRadius.circular(18),
// // //               boxShadow: const [
// // //                 BoxShadow(
// // //                   color: Colors.black12,
// // //                   blurRadius: 8,
// // //                   offset: Offset(0, 4),
// // //                 ),
// // //               ],
// // //             ),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Row(
// // //                   children: [
// // //                     CircleAvatar(
// // //                       radius: 35,
// // //                       backgroundImage: NetworkImage(doctor["image"]!),
// // //                     ),
// // //                     const SizedBox(width: 15),
// // //                     Expanded(
// // //                       child: Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           Text(
// // //                             doctor["name"]!,
// // //                             style: const TextStyle(
// // //                               fontSize: 18,
// // //                               fontWeight: FontWeight.bold,
// // //                             ),
// // //                           ),
// // //                           const SizedBox(height: 4),
// // //                           Text(
// // //                             doctor["specialization"]!,
// // //                             style: const TextStyle(color: Colors.grey),
// // //                           ),
// // //                           const SizedBox(height: 4),
// // //                           Text(
// // //                             doctor["city"]!,
// // //                             style: const TextStyle(color: Colors.grey),
// // //                           ),
// // //                           const SizedBox(height: 6),
// // //                           Row(
// // //                             children: [
// // //                               const Icon(
// // //                                 Icons.star,
// // //                                 color: Colors.orange,
// // //                                 size: 18,
// // //                               ),
// // //                               const SizedBox(width: 4),
// // //                               Text(doctor["rating"]!),
// // //                               const SizedBox(width: 6),
// // //                               Expanded(
// // //                                 child: Text(
// // //                                   "(${doctor["reviews"]})",
// // //                                   style: const TextStyle(color: Colors.grey),
// // //                                   overflow: TextOverflow.ellipsis,
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 14),
// // //                 Row(
// // //                   children: [
// // //                     const Icon(
// // //                       Icons.local_hospital,
// // //                       size: 18,
// // //                       color: Colors.blueGrey,
// // //                     ),
// // //                     const SizedBox(width: 8),
// // //                     Expanded(
// // //                       child: Text(
// // //                         doctor["clinic"] ?? "",
// // //                         style: const TextStyle(
// // //                           fontSize: 13.5,
// // //                           color: Colors.black87,
// // //                           fontWeight: FontWeight.w500,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 10),
// // //                 Text(
// // //                   doctor["details"] ?? "",
// // //                   style: const TextStyle(
// // //                     fontSize: 13.5,
// // //                     color: Colors.black87,
// // //                     height: 1.4,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 10),
// // //                 Container(
// // //                   width: double.infinity,
// // //                   padding: const EdgeInsets.all(12),
// // //                   decoration: BoxDecoration(
// // //                     color: const Color(0xffF6F9FC),
// // //                     borderRadius: BorderRadius.circular(12),
// // //                   ),
// // //                   child: Row(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       const Icon(
// // //                         Icons.calendar_month,
// // //                         size: 18,
// // //                         color: Colors.deepPurple,
// // //                       ),
// // //                       const SizedBox(width: 8),
// // //                       Expanded(
// // //                         child: Text(
// // //                           doctor["appointment"] ?? "",
// // //                           style: const TextStyle(
// // //                             fontSize: 13,
// // //                             color: Colors.black87,
// // //                             height: 1.4,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 15),
// // //                 Wrap(
// // //                   spacing: 10,
// // //                   runSpacing: 10,
// // //                   children: [
// // //                     ElevatedButton.icon(
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: Colors.green,
// // //                       ),
// // //                       icon: const Icon(Icons.call),
// // //                       label: const Text("Call"),
// // //                       onPressed: (doctor["phone"] ?? "").trim().isEmpty
// // //                           ? null
// // //                           : () => callDoctor(doctor["phone"]!),
// // //                     ),
// // //                     ElevatedButton.icon(
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: Colors.blue,
// // //                       ),
// // //                       icon: const Icon(Icons.person),
// // //                       label: const Text("Profile"),
// // //                       onPressed: () => launchURL(doctor["profile"]!),
// // //                     ),
// // //                     ElevatedButton.icon(
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: const Color.fromARGB(
// // //                           255,
// // //                           217,
// // //                           115,
// // //                           236,
// // //                         ),
// // //                       ),
// // //                       icon: const Icon(Icons.calendar_today),
// // //                       label: const Text("Book"),
// // //                       onPressed: () {
// // //                         final msg = (doctor["phone"] ?? "").trim().isNotEmpty
// // //                             ? "Check appointment details on profile or call ${doctor["phone"]}"
// // //                             : "Visit the profile/listing page for appointment details";
// // //                         ScaffoldMessenger.of(context).showSnackBar(
// // //                           SnackBar(content: Text("${doctor["name"]}: $msg")),
// // //                         );
// // //                       },
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ],
// // //             ),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // class ExpertAdvicePage extends StatelessWidget {
// //   ExpertAdvicePage({super.key});

// //   final List<Map<String, String>> therapists = [
// //     {
// //       "name": "Dr. Ashwini Kulkarni",
// //       "specialization": "Psychiatrist & Neuropsychiatrist",
// //       "city": "Pune / PCMC",
// //       "rating": "4.8",
// //       "reviews": "Authorized clinic profile",
// //       "image":
// //           "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?auto=format&fit=crop&w=500&q=80",
// //       "phone": "+917350823573",
// //       "profile": "https://www.drashwinikulkarni.in",
// //       "clinic": "Advait Mindwin Clinic, Pimpri / Deccan Gymkhana / Aundh",
// //       "details":
// //           "Public clinic profile lists psychiatry and neuropsychiatry services in Pune and PCMC, along with qualifications, registration number, clinic timings, and booking details.",
// //       "appointment":
// //           "Call 7350823573. Public page lists Pimpri timings Mon-Sat 10 AM-2 PM, Deccan Tue & Sat 4 PM-6 PM, Aundh Wed & Fri 4 PM-6 PM.",
// //     },
// //     {
// //       "name": "Dr. Rohit Deshmukh",
// //       "specialization": "Psychiatrist, Therapist & Mental Health Expert",
// //       "city": "Mumbai",
// //       "rating": "4.8",
// //       "reviews": "Authorized clinic website",
// //       "image":
// //           "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&w=500&q=80",
// //       "phone": "+919326221954",
// //       "profile": "https://drrohitdeshmukh.in",
// //       "clinic": "Neuro-Psychiatry Practice, Mumbai",
// //       "details":
// //           "Public professional website states he is a board-registered psychiatrist and therapist in Mumbai treating anxiety, depression, OCD, ADHD, stress, sleep issues, and related concerns.",
// //       "appointment":
// //           "Call +91 93262 21954 or use the website contact/consultation options.",
// //     },
// //     {
// //       "name": "Dr. Rohan Jahagirdar",
// //       "specialization": "Consultant Psychiatrist",
// //       "city": "Pune",
// //       "rating": "4.8",
// //       "reviews": "LinkedIn + official website",
// //       "image":
// //           "https://images.unsplash.com/photo-1594824476967-48c8b964273f?auto=format&fit=crop&w=500&q=80",
// //       "phone": "+919881123006",
// //       "profile": "https://www.linkedin.com/in/dr-rohan-jahagirdar-75784338",
// //       "clinic": "Aditya Birla Memorial Hospital / Jehangir / Pune practice",
// //       "details":
// //           "Public LinkedIn profile identifies him as a Pune-based psychiatrist, and public web listings show appointment/contact routing for psychiatric consultation.",
// //       "appointment":
// //           "Call 9881123006 or visit profile/hospital listing for current appointment options.",
// //     },
// //     {
// //       "name": "Shalmalee Gadgil",
// //       "specialization": "Clinical Psychologist & Counselling Professional",
// //       "city": "Pune",
// //       "rating": "Professional profile",
// //       "reviews": "LinkedIn available",
// //       "image":
// //           "https://images.unsplash.com/photo-1622253692010-333f2da6031d?auto=format&fit=crop&w=500&q=80",
// //       "phone": "",
// //       "profile": "https://www.linkedin.com/in/shalmalee-gadgil",
// //       "clinic": "Mental Health Clinic, Pune",
// //       "details":
// //           "Public LinkedIn profile describes clinical psychology, counselling, therapy, psychological testing, and professional registration-related credentials.",
// //       "appointment":
// //           "Visit professional profile for practice details and linked contact routes.",
// //     },
// //     {
// //       "name": "Nilay Datar",
// //       "specialization":
// //           "Clinical Psychologist | Psychometric Assessment & Psychotherapy",
// //       "city": "Pune",
// //       "rating": "Professional profile",
// //       "reviews": "LinkedIn available",
// //       "image":
// //           "https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=crop&w=500&q=80",
// //       "phone": "",
// //       "profile": "https://www.linkedin.com/in/nilay-datar-24aba8221",
// //       "clinic": "SMART Neuropsychiatry Clinic, Pune",
// //       "details":
// //           "Public LinkedIn profile identifies a Pune-based psychologist with psychotherapy and psychometric assessment orientation.",
// //       "appointment":
// //           "Visit profile and clinic references for current consultation route.",
// //     },
// //     {
// //       "name": "Mrs. Swapna M. Nadgauda",
// //       "specialization": "Psychologist",
// //       "city": "Navi Mumbai",
// //       "rating": "Experienced",
// //       "reviews": "31 years experience",
// //       "image":
// //           "https://images.unsplash.com/photo-1651008376811-b90baee60c1f?auto=format&fit=crop&w=500&q=80",
// //       "phone": "",
// //       "profile": "https://www.lybrate.com/navi-mumbai/psychologist",
// //       "clinic": "Healing Touch Counselling Centre, Sanpada",
// //       "details":
// //           "Public Lybrate directory listing shows psychologist details, clinic area, and appointment availability in Navi Mumbai.",
// //       "appointment":
// //           "Use the public listing page to check timings and consultation availability.",
// //     },
// //     {
// //       "name": "Dr. Neha Achrekar",
// //       "specialization": "Psychologist / Counsellor",
// //       "city": "Navi Mumbai",
// //       "rating": "Experienced",
// //       "reviews": "30 years experience",
// //       "image":
// //           "https://images.unsplash.com/photo-1582750433449-648ed127bb54?auto=format&fit=crop&w=500&q=80",
// //       "phone": "",
// //       "profile": "https://www.lybrate.com/navi-mumbai/psychologist",
// //       "clinic": "Counselling Practice, Navi Mumbai",
// //       "details":
// //           "Public Lybrate directory listing shows psychologist profile information and appointment-related access.",
// //       "appointment":
// //           "Open the listing page and check available booking/timing details.",
// //     },
// //     {
// //       "name": "Dr. Bhagyashree S",
// //       "specialization": "Psychotherapist & Counsellor",
// //       "city": "Mumbai",
// //       "rating": "Professional profile",
// //       "reviews": "LinkedIn available",
// //       "image":
// //           "https://images.unsplash.com/photo-1614436163996-25cee5f54290?auto=format&fit=crop&w=500&q=80",
// //       "phone": "",
// //       "profile": "https://www.linkedin.com/in/dr-bhagyashree-s-54bba7153",
// //       "clinic": "Consultant / Self Practice, Mumbai",
// //       "details":
// //           "Public LinkedIn profile lists psychotherapy and counselling work in Mumbai.",
// //       "appointment":
// //           "Visit profile for professional details and current contact route.",
// //     },
// //   ];

// //   final List<Map<String, String>> platforms = [
// //     {
// //       "name": "Apollo 24|7 - Psychiatry",
// //       "type": "Authorized healthcare platform",
// //       "url": "https://www.apollo247.com/specialties/psychiatry",
// //       "desc":
// //           "Book psychiatrists online or in clinic through Apollo’s official platform.",
// //     },
// //     {
// //       "name": "Apollo 24|7 - Clinical Psychologists",
// //       "type": "Authorized healthcare platform",
// //       "url": "https://www.apollo247.com/specialties/clinical-psychologists",
// //       "desc": "Browse clinical psychologists and mental health consultations.",
// //     },
// //     {
// //       "name": "Lybrate - Navi Mumbai Psychologists",
// //       "type": "Doctor discovery platform",
// //       "url": "https://www.lybrate.com/navi-mumbai/psychologist",
// //       "desc":
// //           "Public listings for psychologists with city-wise discovery and booking flow.",
// //     },
// //     {
// //       "name": "Practo - Mental Health Search",
// //       "type": "Authorized healthcare platform",
// //       "url":
// //           "https://www.practo.com/search/doctors?results_type=doctor&q=%5B%7B%22word%22%3A%22psychiatrist%22%2C%22autocompleted%22%3Atrue%2C%22category%22%3A%22subspeciality%22%7D%5D",
// //       "desc":
// //           "Find psychiatrists and related specialists across cities on Practo.",
// //     },
// //     {
// //       "name": "Google Play - Apollo 24|7 App",
// //       "type": "Official app",
// //       "url":
// //           "https://play.google.com/store/apps/details?id=com.apollo.patientapp&hl=en_IN",
// //       "desc":
// //           "Official Apollo healthcare app for doctor search and appointment booking.",
// //     },
// //   ];

// //   Future<void> launchURL(String url) async {
// //     final Uri uri = Uri.parse(url);
// //     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
// //       throw 'Could not launch $url';
// //     }
// //   }

// //   Future<void> callDoctor(String phone) async {
// //     if (phone.trim().isEmpty) return;
// //     final Uri uri = Uri.parse("tel:$phone");
// //     if (!await launchUrl(uri)) {
// //       throw 'Could not call $phone';
// //     }
// //   }

// //   void showAppointmentMessage(
// //     BuildContext context,
// //     Map<String, String> doctor,
// //   ) {
// //     final phone = doctor["phone"] ?? "";
// //     final text = phone.trim().isNotEmpty
// //         ? "For ${doctor["name"]}, call $phone or open profile for appointment details."
// //         : "Open ${doctor["name"]}'s public profile or platform listing for appointment details.";
// //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
// //   }

// //   Widget _buildDoctorCard(BuildContext context, Map<String, String> doctor) {
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 20),
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(18),
// //         boxShadow: const [
// //           BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
// //         ],
// //       ),
// //       child: Column(
// //         children: [
// //           Row(
// //             children: [
// //               CircleAvatar(
// //                 radius: 35,
// //                 backgroundImage: NetworkImage(doctor["image"]!),
// //               ),
// //               const SizedBox(width: 15),
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       doctor["name"]!,
// //                       style: const TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 4),
// //                     Text(
// //                       doctor["specialization"]!,
// //                       style: const TextStyle(color: Colors.grey),
// //                     ),
// //                     const SizedBox(height: 4),
// //                     Text(
// //                       doctor["city"]!,
// //                       style: const TextStyle(color: Colors.grey),
// //                     ),
// //                     const SizedBox(height: 6),
// //                     Row(
// //                       children: [
// //                         const Icon(Icons.star, color: Colors.orange, size: 18),
// //                         const SizedBox(width: 4),
// //                         Text(doctor["rating"]!),
// //                         const SizedBox(width: 6),
// //                         Expanded(
// //                           child: Text(
// //                             "(${doctor["reviews"]})",
// //                             style: const TextStyle(color: Colors.grey),
// //                             overflow: TextOverflow.ellipsis,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 14),
// //           Row(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const Icon(
// //                 Icons.local_hospital,
// //                 size: 18,
// //                 color: Colors.blueGrey,
// //               ),
// //               const SizedBox(width: 8),
// //               Expanded(
// //                 child: Text(
// //                   doctor["clinic"] ?? "",
// //                   style: const TextStyle(
// //                     fontSize: 13.5,
// //                     fontWeight: FontWeight.w500,
// //                     color: Colors.black87,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 10),
// //           Text(
// //             doctor["details"] ?? "",
// //             style: const TextStyle(
// //               fontSize: 13.5,
// //               color: Colors.black87,
// //               height: 1.4,
// //             ),
// //           ),
// //           const SizedBox(height: 10),
// //           Container(
// //             width: double.infinity,
// //             padding: const EdgeInsets.all(12),
// //             decoration: BoxDecoration(
// //               color: const Color(0xffF6F9FC),
// //               borderRadius: BorderRadius.circular(12),
// //             ),
// //             child: Row(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 const Icon(
// //                   Icons.calendar_month,
// //                   size: 18,
// //                   color: Colors.deepPurple,
// //                 ),
// //                 const SizedBox(width: 8),
// //                 Expanded(
// //                   child: Text(
// //                     doctor["appointment"] ?? "",
// //                     style: const TextStyle(
// //                       fontSize: 13,
// //                       color: Colors.black87,
// //                       height: 1.4,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(height: 15),
// //           Wrap(
// //             spacing: 10,
// //             runSpacing: 10,
// //             children: [
// //               ElevatedButton.icon(
// //                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
// //                 icon: const Icon(Icons.call),
// //                 label: const Text("Call"),
// //                 onPressed: (doctor["phone"] ?? "").trim().isEmpty
// //                     ? null
// //                     : () => callDoctor(doctor["phone"]!),
// //               ),
// //               ElevatedButton.icon(
// //                 style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
// //                 icon: const Icon(Icons.person),
// //                 label: const Text("Profile"),
// //                 onPressed: () => launchURL(doctor["profile"]!),
// //               ),
// //               ElevatedButton.icon(
// //                 style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
// //                 icon: const Icon(Icons.calendar_today),
// //                 label: const Text("Book"),
// //                 onPressed: () => showAppointmentMessage(context, doctor),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildPlatformCard(Map<String, String> platform) {
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 14),
// //       padding: const EdgeInsets.all(14),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(16),
// //         boxShadow: const [
// //           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             platform["name"]!,
// //             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //           ),
// //           const SizedBox(height: 4),
// //           Text(
// //             platform["type"]!,
// //             style: const TextStyle(color: Colors.grey, fontSize: 13),
// //           ),
// //           const SizedBox(height: 8),
// //           Text(
// //             platform["desc"]!,
// //             style: const TextStyle(
// //               fontSize: 13.5,
// //               height: 1.4,
// //               color: Colors.black87,
// //             ),
// //           ),
// //           const SizedBox(height: 10),
// //           Align(
// //             alignment: Alignment.centerLeft,
// //             child: OutlinedButton.icon(
// //               onPressed: () => launchURL(platform["url"]!),
// //               icon: const Icon(Icons.open_in_new),
// //               label: const Text("Open Platform"),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xffF4F7F9),
// //       appBar: AppBar(
// //         title: const Text("Expert Advice"),
// //         backgroundColor: const Color(0xff6C9BCF),
// //         elevation: 0,
// //       ),
// //       body: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: [
// //           const Text(
// //             "Mental Health Experts",
// //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //           ),
// //           const SizedBox(height: 6),
// //           const Text(
// //             "Publicly available psychiatrist, psychologist, counsellor and therapist profiles from Pune, Mumbai and nearby cities.",
// //             style: TextStyle(color: Colors.black54, height: 1.4),
// //           ),
// //           const SizedBox(height: 18),
// //           ...therapists.map((doctor) => _buildDoctorCard(context, doctor)),
// //           const SizedBox(height: 8),
// //           const Text(
// //             "Trusted Platforms",
// //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //           ),
// //           const SizedBox(height: 6),
// //           const Text(
// //             "Use these authorized platforms to find verified psychiatrists, psychologists, therapists and counsellors more easily.",
// //             style: TextStyle(color: Colors.black54, height: 1.4),
// //           ),
// //           const SizedBox(height: 16),
// //           ...platforms.map(_buildPlatformCard),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ExpertAdvicePage extends StatelessWidget {
//   ExpertAdvicePage({super.key});

//   final List<Map<String, String>> therapists = [
//     {
//       "name": "Dr. Ashwini Kulkarni",
//       "specialization": "Psychiatrist & Neuropsychiatrist",
//       "city": "Pune / PCMC",
//       "rating": "4.8",
//       "reviews": "Authorized clinic profile",
//       "image":
//           "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?auto=format&fit=crop&w=500&q=80",
//       "phone": "+917350823573",
//       "profile": "https://www.drashwinikulkarni.in",
//       "clinic": "Advait Mindwin Clinic, Pimpri / Deccan / Aundh",
//       "details":
//           "Psychiatry and neuropsychiatry services with public clinic timings, locations and booking details.",
//       "appointment":
//           "Call 7350823573. Pimpri, Deccan and Aundh timings are listed on the official website.",
//     },
//     {
//       "name": "Dr. Rohit Deshmukh",
//       "specialization": "Psychiatrist & Therapist",
//       "city": "Mumbai",
//       "rating": "4.8",
//       "reviews": "Authorized clinic website",
//       "image":
//           "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&w=500&q=80",
//       "phone": "+919326221954",
//       "profile": "https://drrohitdeshmukh.in",
//       "clinic": "Neuro-Psychiatry Practice, Mumbai",
//       "details":
//           "Treats anxiety, stress, OCD, depression, ADHD, sleep issues and related concerns through his public practice website.",
//       "appointment":
//           "Call +91 93262 21954 or use the consultation/contact options on the website.",
//     },
//     {
//       "name": "Dr. Rohan Jahagirdar",
//       "specialization": "Consultant Psychiatrist",
//       "city": "Pune",
//       "rating": "4.8",
//       "reviews": "LinkedIn + official website",
//       "image":
//           "https://images.unsplash.com/photo-1594824476967-48c8b964273f?auto=format&fit=crop&w=500&q=80",
//       "phone": "+919881123006",
//       "profile": "https://www.linkedin.com/in/dr-rohan-jahagirdar-75784338",
//       "clinic": "Aditya Birla Memorial Hospital / Jehangir / Pune practice",
//       "details":
//           "Pune-based psychiatrist with publicly visible professional profile and appointment routing via hospital and clinic listings.",
//       "appointment":
//           "Call 9881123006 or check the linked professional profile and hospital listings.",
//     },
//     {
//       "name": "Dr. Sachin Dhanwade",
//       "specialization": "Consultant Psychiatrist",
//       "city": "Kharadi, Pune",
//       "rating": "5.0",
//       "reviews": "Official clinic website",
//       "image":
//           "https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=crop&w=500&q=80",
//       "phone": "+918329022350",
//       "profile": "https://www.mindfulpsychiatryclinics.in",
//       "clinic": "The Mindful Psychiatry Clinic, Kharadi",
//       "details":
//           "Public website lists anxiety, depression, OCD, ADHD, stress-related disorders and clinic timings.",
//       "appointment":
//           "Call +91 8329022350. Website lists Mon-Sat, 10:00 AM-1:30 PM and 6:00 PM-9:00 PM.",
//     },
//     {
//       "name": "Dr. Milan Balakrishnan",
//       "specialization": "Psychiatrist",
//       "city": "Mumbai",
//       "rating": "4.7",
//       "reviews": "Official doctor website",
//       "image":
//           "https://images.unsplash.com/photo-1651008376811-b90baee60c1f?auto=format&fit=crop&w=500&q=80",
//       "phone": "+919930160068",
//       "profile": "https://www.drmilanb.com",
//       "clinic": "Mumbai Practice",
//       "details":
//           "Public website lists mental health care including depression, anxiety and addiction psychiatry, with booking access.",
//       "appointment":
//           "Call 9930160068 or use the book appointment option on the official website.",
//     },
//     {
//       "name": "Dr. Bharat Sarode",
//       "specialization": "Psychiatrist / Neuropsychiatrist",
//       "city": "Chinchwad, Pune",
//       "rating": "4.3",
//       "reviews": "222 ratings",
//       "image":
//           "https://images.unsplash.com/photo-1582750433449-648ed127bb54?auto=format&fit=crop&w=500&q=80",
//       "phone": "+919035061919",
//       "profile":
//           "https://www.justdial.com/Pune/Psychiatrists-in-Mumbai-Pune-Road-Chinchwad/nct-10393442",
//       "clinic": "Old Bombay Pune Highway, Chinchwad East",
//       "details":
//           "Public Justdial listing shows psychiatrist details, verified business info, consultation fee and booking availability.",
//       "appointment":
//           "Phone 9035061919. Listing mentions 4 locations and online booking availability.",
//     },
//     {
//       "name": "Shalmalee Gadgil",
//       "specialization": "Clinical Psychologist & Counselling Professional",
//       "city": "Pune",
//       "rating": "Professional profile",
//       "reviews": "LinkedIn available",
//       "image":
//           "https://images.unsplash.com/photo-1622253692010-333f2da6031d?auto=format&fit=crop&w=500&q=80",
//       "phone": "",
//       "profile": "https://www.linkedin.com/in/shalmalee-gadgil",
//       "clinic": "Mental Health Clinic, Pune",
//       "details":
//           "Public professional profile highlights clinical psychology, therapy and counselling work in Pune.",
//       "appointment":
//           "Open the professional profile to view current practice and contact route.",
//     },
//     {
//       "name": "Nilay Datar",
//       "specialization": "Clinical Psychologist | Psychotherapy & Assessments",
//       "city": "Pune",
//       "rating": "Professional profile",
//       "reviews": "LinkedIn available",
//       "image":
//           "https://images.unsplash.com/photo-1614436163996-25cee5f54290?auto=format&fit=crop&w=500&q=80",
//       "phone": "",
//       "profile": "https://www.linkedin.com/in/nilay-datar-24aba8221",
//       "clinic": "SMART Neuropsychiatry Clinic, Pune",
//       "details":
//           "Public LinkedIn profile identifies psychotherapy and psychometric assessment experience in Pune.",
//       "appointment":
//           "Use the profile and clinic references to find current consultation details.",
//     },
//     {
//       "name": "Pallavi Shukla",
//       "specialization": "Counseling Psychologist",
//       "city": "Pune",
//       "rating": "Professional profile",
//       "reviews": "LinkedIn available",
//       "image":
//           "https://images.unsplash.com/photo-1607990281513-2c110a25bd8c?auto=format&fit=crop&w=500&q=80",
//       "phone": "",
//       "profile": "https://in.linkedin.com/in/pallavi-shukla-019a7527",
//       "clinic": "Pune Counselling Practice",
//       "details":
//           "Public LinkedIn profile describes counselling psychology, psychotherapy training and Pune-based practice background.",
//       "appointment":
//           "Visit profile for professional contact and current consultation route.",
//     },
//     {
//       "name": "Sayli Agashe",
//       "specialization": "Clinical Psychologist",
//       "city": "Pune",
//       "rating": "Licensed professional",
//       "reviews": "LinkedIn available",
//       "image":
//           "https://images.unsplash.com/photo-1591604466107-ec97de577aff?auto=format&fit=crop&w=500&q=80",
//       "phone": "",
//       "profile": "https://in.linkedin.com/in/sayli-agashe-47b1ab85",
//       "clinic": "Pune Clinical Practice",
//       "details":
//           "Public LinkedIn profile identifies an RCI-registered clinical psychologist with hospital and research experience in Pune.",
//       "appointment":
//           "Open the profile for professional details and contact path.",
//     },
//     {
//       "name": "Mrs. Swapna M. Nadgauda",
//       "specialization": "Psychologist",
//       "city": "Navi Mumbai",
//       "rating": "Experienced",
//       "reviews": "31 years experience",
//       "image":
//           "https://images.unsplash.com/photo-1544717305-2782549b5136?auto=format&fit=crop&w=500&q=80",
//       "phone": "",
//       "profile": "https://www.lybrate.com/navi-mumbai/psychologist",
//       "clinic": "Healing Touch Counselling Centre, Sanpada",
//       "details":
//           "Public directory listing shows practice information, area and appointment visibility in Navi Mumbai.",
//       "appointment":
//           "Use the listing page to check timings and consultation availability.",
//     },
//     {
//       "name": "Dr. Neha Achrekar",
//       "specialization": "Psychologist / Counsellor",
//       "city": "Navi Mumbai",
//       "rating": "Experienced",
//       "reviews": "30 years experience",
//       "image":
//           "https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=500&q=80",
//       "phone": "",
//       "profile": "https://www.lybrate.com/navi-mumbai/psychologist",
//       "clinic": "Navi Mumbai Counselling Practice",
//       "details":
//           "Public directory listing includes psychologist profile visibility and appointment access.",
//       "appointment":
//           "Visit listing page for current availability and consultation flow.",
//     },
//   ];

//   final List<Map<String, String>> platforms = [
//     {
//       "name": "Apollo 24|7 - Psychiatry",
//       "type": "Authorized healthcare platform",
//       "url": "https://www.apollo247.com/specialties/psychiatry",
//       "desc":
//           "Book psychiatrists online or in clinic through Apollo’s official healthcare platform.",
//     },
//     {
//       "name": "Apollo 24|7 - Clinical Psychologists",
//       "type": "Authorized healthcare platform",
//       "url": "https://www.apollo247.com/specialties/clinical-psychologists",
//       "desc":
//           "Browse clinical psychologists and mental health consultations on Apollo.",
//     },
//     {
//       "name": "Lybrate - Navi Mumbai Psychologists",
//       "type": "Doctor discovery platform",
//       "url": "https://www.lybrate.com/navi-mumbai/psychologist",
//       "desc":
//           "Find psychologist listings by area, availability and consultation route.",
//     },
//     {
//       "name": "Practo - Psychiatrist Search",
//       "type": "Authorized healthcare platform",
//       "url":
//           "https://www.practo.com/search/doctors?results_type=doctor&q=%5B%7B%22word%22%3A%22psychiatrist%22%2C%22autocompleted%22%3Atrue%2C%22category%22%3A%22subspeciality%22%7D%5D",
//       "desc":
//           "Search psychiatrists across Indian cities using a recognized healthcare platform.",
//     },
//     {
//       "name": "Mpower Minds",
//       "type": "Mental health platform",
//       "url": "https://mpowerminds.com/best-psychiatrist-in-pune",
//       "desc":
//           "Mental health support platform with psychiatry, psychology and counselling access.",
//     },
//     {
//       "name": "Kokilaben Hospital - Psychiatry",
//       "type": "Authorized hospital psychiatry department",
//       "url":
//           "https://www.kokilabenhospital.com/departments/clinicaldepartments/psychiatry.html",
//       "desc":
//           "Hospital psychiatry department page with specialist access and hospital contact details.",
//     },
//     {
//       "name": "Apollo 24|7 App",
//       "type": "Official app",
//       "url":
//           "https://play.google.com/store/apps/details?id=com.apollo.patientapp&hl=en_IN",
//       "desc":
//           "Official Apollo app for doctor discovery, consultations and appointments.",
//     },
//     {
//       "name": "Center for Mental Health, Pune",
//       "type": "Mental health center",
//       "url": "https://in.linkedin.com/company/center-for-mental-health",
//       "desc":
//           "Pune-based mental health center with psychologists and therapy-related services.",
//     },
//   ];

//   Future<void> launchURL(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//       throw 'Could not launch $url';
//     }
//   }

//   Future<void> callDoctor(String phone) async {
//     if (phone.trim().isEmpty) return;
//     final Uri uri = Uri.parse("tel:$phone");
//     if (!await launchUrl(uri)) {
//       throw 'Could not call $phone';
//     }
//   }

//   void showAppointmentMessage(
//     BuildContext context,
//     Map<String, String> doctor,
//   ) {
//     final phone = doctor["phone"] ?? "";
//     final text = phone.trim().isNotEmpty
//         ? "For ${doctor["name"]}, call $phone or open profile for appointment details."
//         : "Open ${doctor["name"]}'s profile or listing for appointment details.";
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
//   }

//   Widget _buildSectionHeader(String title, String subtitle, IconData icon) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xffEAF2FB),
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 46,
//             width: 46,
//             decoration: BoxDecoration(
//               color: const Color(0xff6C9BCF),
//               borderRadius: BorderRadius.circular(14),
//             ),
//             child: Icon(icon, color: Colors.white),
//           ),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff183B56),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   subtitle,
//                   style: const TextStyle(color: Colors.black54, height: 1.4),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDoctorCard(BuildContext context, Map<String, String> doctor) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: const [
//           BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
//         ],
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 35,
//                 backgroundImage: NetworkImage(doctor["image"]!),
//               ),
//               const SizedBox(width: 15),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       doctor["name"]!,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       doctor["specialization"]!,
//                       style: const TextStyle(color: Colors.grey),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       doctor["city"]!,
//                       style: const TextStyle(color: Colors.grey),
//                     ),
//                     const SizedBox(height: 6),
//                     Row(
//                       children: [
//                         const Icon(Icons.star, color: Colors.orange, size: 18),
//                         const SizedBox(width: 4),
//                         Text(doctor["rating"]!),
//                         const SizedBox(width: 6),
//                         Expanded(
//                           child: Text(
//                             "(${doctor["reviews"]})",
//                             style: const TextStyle(color: Colors.grey),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 14),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Icon(
//                 Icons.local_hospital,
//                 size: 18,
//                 color: Colors.blueGrey,
//               ),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Text(
//                   doctor["clinic"] ?? "",
//                   style: const TextStyle(
//                     fontSize: 13.5,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Text(
//             doctor["details"] ?? "",
//             style: const TextStyle(
//               fontSize: 13.5,
//               color: Colors.black87,
//               height: 1.4,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: const Color(0xffF6F9FC),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Icon(
//                   Icons.calendar_month,
//                   size: 18,
//                   color: Colors.deepPurple,
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     doctor["appointment"] ?? "",
//                     style: const TextStyle(
//                       fontSize: 13,
//                       color: Colors.black87,
//                       height: 1.4,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 15),
//           Wrap(
//             spacing: 10,
//             runSpacing: 10,
//             children: [
//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 icon: const Icon(Icons.call),
//                 label: const Text("Call"),
//                 onPressed: (doctor["phone"] ?? "").trim().isEmpty
//                     ? null
//                     : () => callDoctor(doctor["phone"]!),
//               ),
//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                 icon: const Icon(Icons.person),
//                 label: const Text("Profile"),
//                 onPressed: () => launchURL(doctor["profile"]!),
//               ),
//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
//                 icon: const Icon(Icons.calendar_today),
//                 label: const Text("Book"),
//                 onPressed: () => showAppointmentMessage(context, doctor),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPlatformCard(Map<String, String> platform) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 14),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: const [
//           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             platform["name"]!,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             platform["type"]!,
//             style: const TextStyle(color: Colors.grey, fontSize: 13),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             platform["desc"]!,
//             style: const TextStyle(
//               fontSize: 13.5,
//               height: 1.4,
//               color: Colors.black87,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: OutlinedButton.icon(
//               onPressed: () => launchURL(platform["url"]!),
//               icon: const Icon(Icons.open_in_new),
//               label: const Text("Open Platform"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF4F7F9),
//       appBar: AppBar(
//         title: const Text("Expert Advice"),
//         backgroundColor: const Color(0xff6C9BCF),
//         elevation: 0,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           _buildSectionHeader(
//             "Mental Health Experts",
//             "Browse publicly available psychiatrist, psychologist, counsellor and therapist profiles from Pune, Mumbai and nearby cities.",
//             Icons.psychology_alt_rounded,
//           ),
//           ...therapists.map((doctor) => _buildDoctorCard(context, doctor)),
//           const SizedBox(height: 10),
//           _buildSectionHeader(
//             "Trusted Platforms",
//             "Use authorized platforms and hospital pages to discover verified mental health experts more easily.",
//             Icons.verified_user_rounded,
//           ),
//           ...platforms.map(_buildPlatformCard),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExpertAdvicePage extends StatelessWidget {
  ExpertAdvicePage({super.key});

  final List<Map<String, String>> therapists = [
    {
      "name": "Dr. Ashwini Kulkarni",
      "specialization": "Psychiatrist & Neuropsychiatrist",
      "city": "Pune / PCMC",
      "rating": "4.8",
      "reviews": "Authorized clinic profile",
      "image":
          "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?auto=format&fit=crop&w=500&q=80",
      "phone": "+917350823573",
      "profile": "https://www.drashwinikulkarni.in",
      "clinic": "Advait Mindwin Clinic, Pimpri / Deccan / Aundh",
      "details":
          "Psychiatry and neuropsychiatry services with public clinic timings, locations and booking details.",
      "appointment":
          "Call 7350823573. Pimpri, Deccan and Aundh timings are listed on the official website.",
    },
    {
      "name": "Dr. Rohit Deshmukh",
      "specialization": "Psychiatrist & Therapist",
      "city": "Mumbai",
      "rating": "4.8",
      "reviews": "Authorized clinic website",
      "image":
          "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&w=500&q=80",
      "phone": "+919326221954",
      "profile": "https://drrohitdeshmukh.in",
      "clinic": "Neuro-Psychiatry Practice, Mumbai",
      "details":
          "Treats anxiety, stress, OCD, depression, ADHD, sleep issues and related concerns through his public practice website.",
      "appointment":
          "Call +91 93262 21954 or use the consultation/contact options on the website.",
    },
    {
      "name": "Dr. Rohan Jahagirdar",
      "specialization": "Consultant Psychiatrist",
      "city": "Pune",
      "rating": "4.8",
      "reviews": "LinkedIn + official website",
      "image":
          "https://images.unsplash.com/photo-1594824476967-48c8b964273f?auto=format&fit=crop&w=500&q=80",
      "phone": "+919881123006",
      "profile": "https://www.linkedin.com/in/dr-rohan-jahagirdar-75784338",
      "clinic": "Aditya Birla Memorial Hospital / Jehangir / Pune practice",
      "details":
          "Pune-based psychiatrist with publicly visible professional profile and appointment routing via hospital and clinic listings.",
      "appointment":
          "Call 9881123006 or check the linked professional profile and hospital listings.",
    },
    {
      "name": "Dr. Sachin Dhanwade",
      "specialization": "Consultant Psychiatrist",
      "city": "Kharadi, Pune",
      "rating": "5.0",
      "reviews": "Official clinic website",
      "image":
          "https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=crop&w=500&q=80",
      "phone": "+918329022350",
      "profile": "https://www.mindfulpsychiatryclinics.in",
      "clinic": "The Mindful Psychiatry Clinic, Kharadi",
      "details":
          "Public website lists anxiety, depression, OCD, ADHD, stress-related disorders and clinic timings.",
      "appointment":
          "Call +91 8329022350. Website lists Mon-Sat, 10:00 AM-1:30 PM and 6:00 PM-9:00 PM.",
    },
    {
      "name": "Dr. Milan Balakrishnan",
      "specialization": "Psychiatrist",
      "city": "Mumbai",
      "rating": "4.7",
      "reviews": "Official doctor website",
      "image":
          "https://images.unsplash.com/photo-1651008376811-b90baee60c1f?auto=format&fit=crop&w=500&q=80",
      "phone": "+919930160068",
      "profile": "https://www.drmilanb.com",
      "clinic": "Mumbai Practice",
      "details":
          "Public website lists mental health care including depression, anxiety and addiction psychiatry, with booking access.",
      "appointment":
          "Call 9930160068 or use the book appointment option on the official website.",
    },
    {
      "name": "Dr. Bharat Sarode",
      "specialization": "Psychiatrist / Neuropsychiatrist",
      "city": "Chinchwad, Pune",
      "rating": "4.3",
      "reviews": "222 ratings",
      "image":
          "https://images.unsplash.com/photo-1582750433449-648ed127bb54?auto=format&fit=crop&w=500&q=80",
      "phone": "+919035061919",
      "profile":
          "https://www.justdial.com/Pune/Psychiatrists-in-Mumbai-Pune-Road-Chinchwad/nct-10393442",
      "clinic": "Old Bombay Pune Highway, Chinchwad East",
      "details":
          "Public Justdial listing shows psychiatrist details, verified business info, consultation fee and booking availability.",
      "appointment": "Phone 9035061919. Listing mentions booking availability.",
    },
  ];

  final List<Map<String, String>> platforms = [
    {
      "name": "Apollo 24|7 - Psychiatry",
      "type": "Authorized healthcare platform",
      "url": "https://www.apollo247.com/specialties/psychiatry",
      "desc":
          "Book psychiatrists online or in clinic through Apollo’s official healthcare platform.",
    },
    {
      "name": "Apollo 24|7 - Clinical Psychologists",
      "type": "Authorized healthcare platform",
      "url": "https://www.apollo247.com/specialties/clinical-psychologists",
      "desc":
          "Browse clinical psychologists and mental health consultations on Apollo.",
    },
    {
      "name": "Lybrate - Navi Mumbai Psychologists",
      "type": "Doctor discovery platform",
      "url": "https://www.lybrate.com/navi-mumbai/psychologist",
      "desc":
          "Find psychologist listings by area, availability and consultation route.",
    },
    {
      "name": "Practo - Psychiatrist Search",
      "type": "Authorized healthcare platform",
      "url":
          "https://www.practo.com/search/doctors?results_type=doctor&q=%5B%7B%22word%22%3A%22psychiatrist%22%2C%22autocompleted%22%3Atrue%2C%22category%22%3A%22subspeciality%22%7D%5D",
      "desc":
          "Search psychiatrists across Indian cities using a recognized healthcare platform.",
    },
    {
      "name": "Mpower Minds",
      "type": "Mental health platform",
      "url": "https://mpowerminds.com/best-psychiatrist-in-pune",
      "desc":
          "Mental health support platform with psychiatry, psychology and counselling access.",
    },
    {
      "name": "Kokilaben Hospital - Psychiatry",
      "type": "Authorized hospital psychiatry department",
      "url":
          "https://www.kokilabenhospital.com/departments/clinicaldepartments/psychiatry.html",
      "desc":
          "Hospital psychiatry department page with specialist access and hospital contact details.",
    },
  ];

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> callDoctor(String phone) async {
    if (phone.trim().isEmpty) return;
    final Uri uri = Uri.parse("tel:$phone");
    if (!await launchUrl(uri)) {
      throw 'Could not call $phone';
    }
  }

  void showAppointmentMessage(
    BuildContext context,
    Map<String, String> doctor,
  ) {
    final phone = doctor["phone"] ?? "";
    final text = phone.trim().isNotEmpty
        ? "For ${doctor["name"]}, call $phone or open profile for appointment details."
        : "Open ${doctor["name"]}'s profile for appointment details.";
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Widget _buildDoctorCard(BuildContext context, Map<String, String> doctor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 34,
                backgroundImage: NetworkImage(doctor["image"]!),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor["name"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1F1F1F),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doctor["specialization"]!,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doctor["city"]!,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          doctor["rating"]!,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            doctor["reviews"]!,
                            style: const TextStyle(color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              doctor["clinic"] ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff374151),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              doctor["details"] ?? "",
              style: const TextStyle(
                fontSize: 13.5,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xffF4F7FB),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              doctor["appointment"] ?? "",
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: const Icon(Icons.call),
                  label: const Text("Call"),
                  onPressed: (doctor["phone"] ?? "").trim().isEmpty
                      ? null
                      : () => callDoctor(doctor["phone"]!),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: const Icon(Icons.person),
                  label: const Text("Profile"),
                  onPressed: () => launchURL(doctor["profile"]!),
                ),
              ),
              const SizedBox(width: 10),
              // Expanded(
              //   child: ElevatedButton.icon(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.purple,
              //       foregroundColor: Colors.white,
              //       padding: const EdgeInsets.symmetric(vertical: 14),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(16),
              //       ),
              //     ),
              //     icon: const Icon(Icons.calendar_today),
              //     label: const Text("Book"),
              //     onPressed: () => showAppointmentMessage(context, doctor),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformCard(Map<String, String> platform) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            platform["name"]!,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xff1F1F1F),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            platform["type"]!,
            style: const TextStyle(color: Colors.grey, fontSize: 13.5),
          ),
          const SizedBox(height: 10),
          Text(
            platform["desc"]!,
            style: const TextStyle(
              fontSize: 13.5,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff6C9BCF),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () => launchURL(platform["url"]!),
            icon: const Icon(Icons.open_in_new),
            label: const Text("Open Platform"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffF4F7F9),
        appBar: AppBar(
          title: const Text("Expert Advice"),
          backgroundColor: const Color(0xFF7C6CF6),
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: "Mental Health Experts"),
              Tab(text: "Trusted Platforms"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  "Mental Health Experts",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1F2937),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Browse psychiatrists, psychologists, counsellors and mental health specialists.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 18),
                ...therapists.map(
                  (doctor) => _buildDoctorCard(context, doctor),
                ),
              ],
            ),
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  "Trusted Platforms",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1F2937),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Use trusted healthcare and hospital platforms to discover verified mental health professionals.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 18),
                ...platforms.map(_buildPlatformCard),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
