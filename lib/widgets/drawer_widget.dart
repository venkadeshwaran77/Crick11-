import 'package:crick11/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xffd8f2f7)),
            accountName: Text(
              "Venkadesh",
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            accountEmail: Text(
              "venkadesh77@gmail.com",
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.png"),
            ),
            otherAccountsPictures: [
              Text("Free User", style: TextStyle(color: Colors.black87)),
              IconButton(onPressed: () {}, icon: Icon(Icons.logout_outlined)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: 0.63,
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("63%", style: TextStyle(fontSize: 12)),
                    Chip(
                      label: Text(
                        "PRO @ ₹399/YEAR",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                DrawerItems(title: "Home", icons: Icons.home_filled),
                Divider(thickness: 1),
                DrawerItems(
                  title: "Start A Match",
                  icons: Icons.sports_cricket,
                  tag: "FREE",
                ),
                DrawerItems(title: "Go Live", icons: Icons.videocam),
                DrawerItems(title: "My Matches", icons: Icons.sports),
                Divider(thickness: 1),
                DrawerItems(
                  title: "LeaderBoards",
                  icons: Icons.leaderboard_outlined,
                ),
                DrawerItems(title: "Crick11 Awards", icons: Icons.emoji_events),
                DrawerItems(title: "Looking for", icons: Icons.travel_explore),
                DrawerItems(title: "Community", icons: Icons.groups_2_outlined),
                DrawerItems(title: "Market", icons: Icons.storefront_outlined),
                DrawerItems(title: "Add-Ons", icons: Icons.extension_outlined),
                DrawerItems(title: "Themes", icons: Icons.color_lens_outlined),
                DrawerItems(
                  title: "Associations",
                  icons: Icons.account_tree_outlined,
                ),
                DrawerItems(title: "Clubs", icons: Icons.home_work_outlined),
                DrawerItems(title: "Share the App", icons: Icons.share),
                DrawerItems(title: "Rate us", icons: Icons.star_border),
                DrawerItems(title: "App code", icons: Icons.lock_outline),
                DrawerItems(title: "Support", icons: Icons.support_agent),
                DrawerItems(title: "Change Language", icons: Icons.translate),
                DrawerItems(
                  title: "Follow Us",
                  icons: Icons.share_arrival_time_outlined,
                ),
                DrawerItems(
                  title: "Others/Help",
                  icons: Icons.description_outlined,
                ),
                DrawerItems(title: "LogOut", icons: Icons.logout_outlined,destination:SplashScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    super.key,
    required this.title,
    required this.icons,
    this.tag,
    this.destination,
  });
  final String title;
  final IconData icons;
  final String? tag;
  final Widget? destination;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icons, color: Colors.grey[800]),
      title: Row(
        children: [
          Expanded(child: Text(title)),

          if (tag != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: tag == "FREE" ? Colors.orange : Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                tag!,
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ),
        ],
      ),
      onTap: () {
        if (destination != null) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination!),
          );
        }
      },
    );
  }
}
