class Doctor {
    final String id;
    final String name;
    final String email;
    final String profilePicture;
    final String role;
    final String phone;
    final String address;
    final String city;
    final String state;
    final String zipCode;
    final String country;
    final DateTime createdAt;
    final DateTime updatedAt;

    Doctor({
        required this.id,
        required this.name,
        required this.email,
        required this.profilePicture,
        required this.role,
        required this.phone,
        required this.address,
        required this.city,
        required this.state,
        required this.zipCode,
        required this.country,
        required this.createdAt,
        required this.updatedAt,
    });
}