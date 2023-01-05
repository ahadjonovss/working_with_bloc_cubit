import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/area_calc_cubit/areaCubit.dart';

import '../bloc/area_calc_cubit/area_state.dart';

class SecondTask extends StatelessWidget {
  const SecondTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AreaCalcCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body:Center(
          child: Column(
            children: [
              BlocBuilder<AreaCalcCubit,AreaState>(
                builder: (context, state) {
                  if(state is RectangleState){
                    return Text("Area of your rectangle is : ${state.rectangleArea}");
                  }
                  if(state is CircleState){
                    return Text("Area of your circle is : ${state.circleArea}");
                  }
                  if(state is SquareState){
                    return Text("Area of your square is : ${state.squareArea}");
                  }
                  return Row(
                    children: [
                      TextButton(onPressed: (){
                        BlocProvider.of<AreaCalcCubit>(context)
                            .calcRectArea(12, 12);
                      }, child: const Text("Rectangle")),
                      TextButton(onPressed: (){
                        BlocProvider.of<AreaCalcCubit>(context)
                            .calcCircleArea(12, 12);

                      }, child: const Text("Circle")),
                      TextButton(onPressed: (){
                        BlocProvider.of<AreaCalcCubit>(context)
                            .calcSquareArea(12, 12);
                      }, child: const  Text("Square")),
                    ],
                  );
                },

              ),

            ],
          ),
        )

      ),
    );
  }
}
