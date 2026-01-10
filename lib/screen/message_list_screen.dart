import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'chat_screen.dart';

class MessageListScreen extends StatelessWidget {
  const MessageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chatList = [
      {
        "name": "Kopi Kenangan Senja",
        "msg": "Kapan bisa mulai kerja?",
        "time": "10:20",
        "logo": "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400",
        "unread": "1"
      },
      {
        "name": "Toko Berkah Jaya",
        "msg": "Halo, CV Anda sudah kami terima.",
        "time": "Kemarin",
        "logo": "https://images.unsplash.com/photo-1586769852044-692d6e3703f0?w=400",
        "unread": "0"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Pesan",
          style: TextStyle(
            color: CreaTaskColors.textMain,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return _buildChatTile(context, chat);
        },
      ),
    );
  }

  Widget _buildChatTile(BuildContext context, Map<String, String> chat) {
    bool hasUnread = chat["unread"] != "0";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ChatScreen(
                    companyName: chat['name']!,
                    companyLogo: chat['logo']!,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade100, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: CreaTaskColors.seaMist,
                          backgroundImage: NetworkImage(chat['logo']!),
                        ),
                      ),
                      if (hasUnread)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: const Color(0xFF27AE60),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              chat['name']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: CreaTaskColors.textMain,
                              ),
                            ),
                            Text(
                              chat['time']!,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                chat['msg']!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: hasUnread ? CreaTaskColors.textMain : CreaTaskColors.textSecondary,
                                  fontWeight: hasUnread ? FontWeight.w700 : FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            if (hasUnread)
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: CreaTaskColors.deepOcean.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  chat["unread"]!,
                                  style: const TextStyle(
                                    color: CreaTaskColors.deepOcean,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}