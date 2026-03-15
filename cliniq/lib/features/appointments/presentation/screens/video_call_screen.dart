import 'package:cliniq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class VideoCallScreen extends StatefulWidget {
  final String doctorName;
  final String doctorImage;

  const VideoCallScreen({
    super.key,
    required this.doctorName,
    required this.doctorImage,
  });

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool _isMuted = false;
  bool _isCameraOff = false;
  int _seconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _seconds++;
        });
      }
    });
  }

  String _formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return "${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Doctor's Video (Placeholder Image)
          Image.network(
            widget.doctorImage.isNotEmpty 
                ? widget.doctorImage 
                : 'https://images.unsplash.com/photo-1559839734-2b71f1536780?auto=format&fit=crop&q=80&w=2070',
            fit: BoxFit.cover,
          ),

          // Dark overlay for UI visibility
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black54,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.8),
                ],
              ),
            ),
          ),

          // Top Info
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.fiber_manual_record, color: Colors.white, size: 12),
                            SizedBox(width: 6),
                            Text(
                              "LIVE",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        _formatTime(_seconds),
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
                        style: IconButton.styleFrom(backgroundColor: Colors.black26),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.doctorName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      shadows: [Shadow(color: Colors.black45, blurRadius: 10)],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // User's Camera Preview (Small PIP)
          Positioned(
            top: 140,
            right: 24,
            child: Container(
              width: 120,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white24, width: 2),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 20, spreadRadius: 5)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: _isCameraOff 
                  ? Container(
                      color: Colors.grey[900],
                      child: const Icon(Icons.videocam_off_rounded, color: Colors.white38, size: 40),
                    )
                  : Image.network(
                      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=1064',
                      fit: BoxFit.cover,
                    ),
              ),
            ),
          ),

          // Bottom Controls
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildControlButton(
                  onPressed: () => setState(() => _isMuted = !_isMuted),
                  icon: _isMuted ? Icons.mic_off_rounded : Icons.mic_rounded,
                  color: _isMuted ? Colors.white24 : Colors.white12,
                ),
                _buildControlButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icons.call_end_rounded,
                  color: Colors.redAccent,
                  size: 72,
                  iconSize: 32,
                ),
                _buildControlButton(
                  onPressed: () => setState(() => _isCameraOff = !_isCameraOff),
                  icon: _isCameraOff ? Icons.videocam_off_rounded : Icons.videocam_rounded,
                  color: _isCameraOff ? Colors.white24 : Colors.white12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required VoidCallback onPressed,
    required IconData icon,
    required Color color,
    double size = 60,
    double iconSize = 28,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: color == Colors.white12 ? Border.all(color: Colors.white24) : null,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: iconSize),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
