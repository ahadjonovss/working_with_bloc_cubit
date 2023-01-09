import 'package:flutter/material.dart';
import 'package:working_with_bloc_cubit/ui/car_page.dart';

import '../../data/models/car_full_info.dart';
import '../../utils/font.dart';


// ignore: must_be_immutable
class CarItemWidget extends StatelessWidget {
  dynamic car;
  CarItemWidget({required this.car,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CarPage(),));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(13),
        height: MediaQuery.of(context).size.height*0.21,
        width: MediaQuery.of(context).size.width*0.47,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF6B7181),
                Color(0xFF000000),
              ]
          ),
          borderRadius: BorderRadius.circular(18),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Text("⭐️ 4.5",style: TextStyle(color: Colors.white),),
            const SizedBox(height: 28,),
            SizedBox(
                height: MediaQuery.of(context).size.height*0.12,
                child: Image.network(car.logo)),
            Row(
              children: [
                Image.network(car.logo,width: 20,),
                const SizedBox(width: 4,),
                Text(car.carModel,style: font()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Image.asset(AppImages.brand,width: 20,color: Colors.transparent,),
                    const SizedBox(width: 4,),
                    Text("\$ ${car.averagePrice}",style: font()),

                  ],
                ),
                Container(
                  height: 20,
                  width: 24,
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF6B7181),
                          const Color(0xFF374957).withOpacity(0.2),
                        ]
                    ),
                    borderRadius: BorderRadius.circular(4),

                  ),
                  child: const  Center(
                    child: Icon(Icons.navigate_next_outlined,color: Colors.white,size: 20,),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}