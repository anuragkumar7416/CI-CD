import 'package:cicd_test/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChanged = false;
  final GlobalKey _scaffoldKey =  GlobalKey();

  void _onLogOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', false);
   Get.to(()=>const LoginScreen());
  }

  Widget movies(String title,String imageLink){
    return  SizedBox(
      height: 150,
      width: 140,
      child: Column(
        children: [
          Expanded(
              child: Image.network(
                imageLink,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget categoryStrip(String category){
    return  Container(
      margin: const EdgeInsets.only(
          top: 40, left: 20, right: 20, bottom: 20),
      child: Row(
        children:  [
          Text(
            category,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          const Text(
            'View All',
            style: TextStyle(color: Color(0xffb82520)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xff1c1c1c),
        leading: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        title: Image.asset('assets/images/netflix-2.png'),
        actions: [
          Builder(

              builder: (BuildContext context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();

                  },
                  icon: SizedBox(
                      width: 30,
                      height: 30,
                      child: ClipOval(
                          child: Image.asset(
                            'assets/images/anurag.jpeg',
                            fit: BoxFit.cover,
                          ))),
                );
              }
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Center(child: Column(
                children: [
                  Container(height:100,width:100,decoration:BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 3,color: Colors.white)
                  ),child: ClipOval(child: Image.asset('assets/images/anurag.jpeg',fit: BoxFit.fill,))),
                  const Text('Anurag',style:  TextStyle(color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                ],
              )),
            ),
            Expanded(child: Container(
              color: Colors.grey.shade800,
              child: Column(
                children: [
                  ListTile(leading: const Icon(Icons.logout),title: const Text('Logout'),
                      onTap: (){
                        _onLogOut();
                      }),
                ],
              ),
            ),)


          ],
        ),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset('assets/images/img_1.png'),
              Container(
                margin: const EdgeInsets.only(top: 200, left: 20),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffe50812), foregroundColor: Colors.white),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle_outline_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    label: const Text('Resume')),
              ),
              Container(
                margin: const EdgeInsets.only(top: 130, left: 200),
                height: 150,
                width: 150,
                child: Image.network(
                    'https://logos-world.net/wp-content/uploads/2020/05/Stranger-Things-Logo.png'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 243),
                child: const Divider(
                  thickness: 2,
                  endIndent: 200,
                  color: Color(0xffe50812),
                ),
              )
            ],
          ),
          Flexible(
            fit: FlexFit.loose,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  categoryStrip('Recently Watched'),
                  Container(
                    margin: const EdgeInsets.only(left: 7),
                    height: 200,
                    width: 400,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        movies('Never Have I ever', 'https://media1.popsugar-assets.com/files/thumbor/BjRqYHUDAlethQsPSI45SjoK96c/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2023/05/09/642/n/1922283/fd4c9b65fbb18dfb_EN-US_NeverHaveIEver_Main_Group_Vertical_27x40_RGB_PRE/i/Never-Have-I-Ever-Season-4-Poster.jpg'),
                        movies('Sacred Games', 'https://m.media-amazon.com/images/M/MV5BYTMzYTQ1NzAtOGY4OC00ZGM5LThiMmUtMzgzZjgzNzNjZjJmXkEyXkFqcGdeQXVyODk2ODI3MTU@._V1_.jpg'),
                        movies('Narcos Mexico', 'https://flxt.tmsimg.com/assets/p15917262_b_v13_ad.jpg'),
                        movies('Squid Game', 'https://flixpatrol.com/runtime/cache/files/posters/d/ddlemu3ez0pgg93k2svnlcjcsve.webp'),
                      ],
                    ),
                  ),
                  categoryStrip('Hollywood Movies'),
                  Container(
                    margin: const EdgeInsets.only(left: 7),
                    height: 200,
                    width: 400,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        movies('Extraction', 'https://m.media-amazon.com/images/M/MV5BMDJiNzUwYzEtNmQ2Yy00NWE4LWEwNzctM2M0MjE0OGUxZTA3XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg'),
                        movies('Red Notice', 'https://www.tvguide.com/a/img/catalog/provider/1/2/1-10743344829.jpg'),
                        movies('Downfall', 'https://upload.wikimedia.org/wikipedia/en/thumb/d/de/Downfall_Poster.jpg/220px-Downfall_Poster.jpg'),
                        movies('The Royal Treatment', 'https://upload.wikimedia.org/wikipedia/en/4/42/The_Royal_Treatment.jpg'),
                      ],
                    ),
                  ),
                  categoryStrip('Bollywood Movies'),
                  Container(
                    margin: const EdgeInsets.only(left: 7),
                    height: 200,
                    width: 400,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        movies('Luka Chuppi', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/ab/Luka_Chuppi_poster.jpeg/220px-Luka_Chuppi_poster.jpeg'),
                        movies('Bulbbul', 'https://resizing.flixster.com/pWr45GcGjfplZMjHs7XjsGNBv9E=/ems.ZW1zLXByZC1hc3NldHMvbW92aWVzLzFmMmY0MzcwLTM3MmUtNDcyYS04YTUwLTg5NmQyNWQxOGU2ZS53ZWJw'),
                        movies('Welcome', 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f4/Welcome_poster_2007.jpg/220px-Welcome_poster_2007.jpg'),
                        movies('Ludo', 'https://upload.wikimedia.org/wikipedia/en/a/af/Ludo_film_poster.jpg'),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   iconSize: 35,
      //   items: [
      //     const BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
      //     const BottomNavigationBarItem(icon: Icon(Icons.star_outline), label: ''),
      //     BottomNavigationBarItem(
      //         icon: Container(
      //             decoration: BoxDecoration(
      //                 shape: BoxShape.circle,
      //                 border: Border.all(width: 4, color: Colors.black),
      //                 boxShadow: const [
      //                   BoxShadow(color: Colors.white, blurRadius: 3)
      //                 ]),
      //             child: Image.asset(
      //               'assets/images/netflix-3.png',
      //             )),
      //         label: ''),
      //     const BottomNavigationBarItem(
      //         icon: Icon(Icons.folder_open_rounded), label: ''),
      //     const BottomNavigationBarItem(
      //         icon: Icon(Icons.settings_outlined), label: ''),
      //   ],
      //   currentIndex: 2,
      //   selectedItemColor: const Color(0xffe50812),
      //   unselectedItemColor: Colors.grey,
      //   elevation: 100,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(

        onPressed: (){},
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 6, color: const Color(0xff352928)),
                boxShadow: const [
                  BoxShadow(color: Colors.white, blurRadius: 3)
                ]),
            child: Image.asset(
              'assets/images/netflix-3.png',
            )),
      ),

      bottomNavigationBar: Container(
        color: const Color(0xff282828),
        margin: const EdgeInsets.only(bottom: 40),
        height: 60,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: [
            const SizedBox(width: 20,),
            IconButton(onPressed: (){}, icon:const Icon(Icons.menu),iconSize: 35,),
            const SizedBox(width: 20,),
            IconButton(onPressed: (){}, icon:const Icon(Icons.star_outline),iconSize: 35,),
            const SizedBox(width: 100,),
            IconButton(onPressed: (){}, icon:const Icon(Icons.folder_open_rounded),iconSize: 35,),
            const SizedBox(width: 30,),
            IconButton(onPressed: (){}, icon:const Icon(Icons.settings_outlined),iconSize: 35,),
          ],
        ),
      ),
    );
  }
}