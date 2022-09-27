import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrugsScreen extends StatefulWidget {
  const DrugsScreen({Key? key}) : super(key: key);

  @override
  State<DrugsScreen> createState() => _DrugsScreenState();
}

class _DrugsScreenState extends State<DrugsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.list),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                Icon(Icons.search_rounded),
                Image.asset(
                  "assets/images/information1.png",
                  height: 16,
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                )
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [Icon(Icons.arrow_back), Text("Back")],
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Spacer(),
                          const Text(
                            "ابروفين",
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 32),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/pills-bottle.png",
                        height: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Column(
                        children: [
                          CardOfDrugs(
                            icon: "assets/images/calendar.png",
                            txt1: " :مدةاخذ الدواء",
                            des: 'قبل الطعام 3 ملات في اليوم',
                            txt2: 'اسبوعين',
                            IsBold: false,
                          ),
                        ],
                      ),
                      Container(height: 1,width: MediaQuery.of(context).size.width,color: Colors.grey,),
                      CardOfDrugs(
                        icon: "assets/images/blood.png",
                        txt1: "",
                        des: 'لا كحول, لا عصير',
                        txt2: 'يأخذ مع المياه',
                        IsBold: true,
                      ),
                      Container(height: 1,width: MediaQuery.of(context).size.width,color: Colors.grey,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "الوصف",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox( width: 8,),
                                Image.asset("assets/images/drugs.png", height: 24),
                              ],
                            ),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.7,
                              child: const Text(
                                "ولكن لكي ترى من أين يولد كل هذا الخطأ ممن يتهمون باللذة والحمد بالألم.سأفتح الأمر برمته ، وأشرح نفس الأشياء التي قالها مكتشف الحقيقة هذا ، ولأنه كان مهندس الحياة السعيدة.",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 24,
                  right: 24,
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.08,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff2196F3)
                    ),
                    child: const Center(child: Text("من اين اشتري",style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardOfDrugs extends StatelessWidget {
  String icon;
  String txt1;
  String txt2 = '';
  String des;
  bool IsBold;

  CardOfDrugs({
    Key? key,
    required this.icon,
    required this.des,
    required this.txt1,
    required this.txt2,
    required this.IsBold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        txt2,
                      ),
                      Text(
                        txt1,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    des,
                    style: TextStyle(
                        fontWeight: IsBold ? FontWeight.bold : FontWeight.normal),
                  ),
                ],
              ),
              SizedBox( width: 8,),
              Image.asset(icon, height: 24),
            ],
          ),
        ],
      ),
    );
  }
}
