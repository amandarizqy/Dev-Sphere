import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class ChatScreen extends StatefulWidget {
  final String companyName;
  final String companyLogo;

  const ChatScreen({
    super.key,
    this.companyName = "Kopi Kenangan Senja",
    this.companyLogo = "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400",
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [
    {
      "text": "Halo! Saya tertarik dengan lowongan Barista Part-Time ini.",
      "isMe": true,
      "time": "10:30",
    },
    {
      "text": "Halo juga! Terima kasih sudah menghubungi kami. Apakah kamu memiliki pengalaman sebelumnya?",
      "isMe": false,
      "time": "10:32",
    },
    {
      "text": "Saya memiliki pengalaman magang selama 3 bulan. Saya sudah paham dasar espresso.",
      "isMe": true,
      "time": "10:35",
    },
    {
      "text": "Bagus sekali. Bisakah kamu datang untuk interview besok jam 2 siang?",
      "isMe": false,
      "time": "10:36",
    },
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    
    setState(() {
      _messages.add({
        "text": _messageController.text,
        "isMe": true,
        "time": "${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}",
      });
      _messageController.clear();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildSafetyBanner(),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _buildChatBubble(msg["text"], msg["isMe"], msg["time"]);
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: CreaTaskColors.textMain, size: 20),
        mouseCursor: SystemMouseCursors.click,
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: CreaTaskColors.seaMist,
                backgroundImage: NetworkImage(widget.companyLogo),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.companyName,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: CreaTaskColors.textMain),
              ),
              const Text(
                "Online",
                style: TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: CreaTaskColors.textMain),
          mouseCursor: SystemMouseCursors.click,
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: Colors.grey.shade100, height: 1),
      ),
    );
  }

  Widget _buildSafetyBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.orange.shade50,
      child: Row(
        children: [
          Icon(Icons.gpp_maybe_outlined, size: 16, color: Colors.orange.shade800),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "Waspada terhadap penipuan. Jangan bagikan data pribadi.",
              style: TextStyle(fontSize: 11, color: Colors.orange.shade900, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String text, bool isMe, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isMe ? CreaTaskColors.deepOcean : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: Radius.circular(isMe ? 20 : 4),
                bottomRight: Radius.circular(isMe ? 4 : 20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : CreaTaskColors.textMain,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              time,
              style: const TextStyle(fontSize: 10, color: CreaTaskColors.driftwood, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          )
        ],
      ),
      child: Row(
        children: [
          Material(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(14),
              mouseCursor: SystemMouseCursors.click,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: const Icon(Icons.add_rounded, color: CreaTaskColors.deepOcean, size: 24),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                controller: _messageController,
                mouseCursor: SystemMouseCursors.text,
                decoration: const InputDecoration(
                  hintText: "Tulis pesan Anda...",
                  hintStyle: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Material(
            color: CreaTaskColors.deepOcean,
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              onTap: _sendMessage,
              borderRadius: BorderRadius.circular(14),
              mouseCursor: SystemMouseCursors.click,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: const Icon(Icons.send_rounded, color: Colors.white, size: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }
}