import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/textmakercubit.dart';
import 'package:working_with_bloc_cubit/ui/second_task.dart';

class FirstTask extends StatelessWidget {
  const FirstTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => TextMakerCubit("Salom")),
      child: Scaffold(
        body: BlocBuilder<TextMakerCubit, String>(
          builder: (context, state) => SafeArea(
              child: Center(
                child: Column(
            children: [
              const SizedBox(height: 100,),
              Text(state),
               Padding(
                padding:const  EdgeInsets.all(20),
                child:  TextField(
                  onChanged: (value) {
                    TextMakerCubit(value);
                    context.read<TextMakerCubit>().stateToUpperCase(value);

                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
              )),
        ),
        appBar: AppBar(actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>SecondTask()));
          }, icon: Icon(Icons.next_plan))
        ],),
      ),
    );
  }
}
