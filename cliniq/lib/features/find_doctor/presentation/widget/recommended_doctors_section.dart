import 'package:cliniq/features/find_doctor/presentation/widget/recommended_doctors_card.dart';
import 'package:flutter/material.dart';

class RecommendedDoctorsSection extends StatelessWidget {
  const RecommendedDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended Doctors",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              TextButton(onPressed: () {}, child: Text("See all")),
            ],
          ),
          SizedBox(height: 10),
          RecommendedDoctorsCard(
            name: 'Dr. James Wilson',
            hospital: 'Heart Center',
            image: 'https://randomuser.me/api/portraits/men/1.jpg',
            rating: '4.8',
            speciality: 'Cardiologist',
            time: DateTime(2024, 3, 7, 10, 0),
          ),
          RecommendedDoctorsCard(
            name: 'Dr. Sarah Johnson',
            hospital: 'Kids Care',
            image: 'https://randomuser.me/api/portraits/women/2.jpg',
            rating: '4.9',
            speciality: 'Pediatrician',
            time: DateTime(2024, 3, 6, 14, 30),
          ),
          RecommendedDoctorsCard(
            name: 'Dr. Michael Chen',
            hospital: 'Skin Lab',
            image: 'https://randomuser.me/api/portraits/men/3.jpg',
            rating: '4.7',
            speciality: 'Dermatologist',
            time: DateTime(2024, 3, 12, 9, 15),
          ),
          RecommendedDoctorsCard(
            name: 'Dr. Elena Rodriguez',
            hospital: 'Brain & Spine',
            image: 'https://randomuser.me/api/portraits/women/4.jpg',
            rating: '5.0',
            speciality: 'Neurologist',
            time: DateTime(2024, 3, 6, 16, 0),
          ),
          RecommendedDoctorsCard(
            name: 'Dr. David Patel',
            hospital: 'Bone & Joint',
            image: 'https://randomuser.me/api/portraits/men/5.jpg',
            rating: '4.6',
            speciality: 'Orthopedic',
            time: DateTime(2024, 3, 8, 11, 0),
          ),
          RecommendedDoctorsCard(
            name: 'Dr. Aisha Mensah',
            hospital: 'Vision Plus',
            image: 'https://randomuser.me/api/portraits/women/6.jpg',
            rating: '4.8',
            speciality: 'Ophthalmologist',
            time: DateTime(2024, 3, 9, 8, 30),
          ),
          RecommendedDoctorsCard(
            name: 'Dr. Robert Kim',
            hospital: 'Dental Pro',
            image: 'https://randomuser.me/api/portraits/men/7.jpg',
            rating: '4.9',
            speciality: 'Dentist',
            time: DateTime(2024, 3, 10, 13, 0),
          ),
        ],
      ),
    );
  }
}
