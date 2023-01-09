import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_bloc.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_event.dart';
import 'package:working_with_bloc_cubit/bloc/cars/cars_state.dart';
import 'package:working_with_bloc_cubit/data/repositories/cars_repository.dart';
import 'package:working_with_bloc_cubit/ui/widgets/car_item.dart';

class AllCarsPage extends StatelessWidget {
  const AllCarsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarsBloc(CarsRepository()),
        child:  Scaffold(
          backgroundColor: Colors.black,
          body: BlocBuilder<CarsBloc,CarsState>(
            builder: (BuildContext context, state) {
              if( state is LoadCarsInProgress){
                return Center(child: CircularProgressIndicator(),);
              }
              if(state is LoadCarsInSuccess){
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor: Colors.black,
                          expandedHeight: 300.0,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Image.network("https://www.hdwallpaperspulse.com/wp-content/uploads/2014/07/03/charm-wallpaper-maserati-granturismo-car-cars-free-desktop-free.jpg"),
                          ),
                          title: Text("Cars"),
                          centerTitle: true,
                          pinned: true,
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(12),

                          sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              childCount: state.cars.data.length,
                                  (context, index) => CarItemWidget(car: state.cars.data[index]),
                            ),
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                mainAxisSpacing: 10,
                                maxCrossAxisExtent: MediaQuery.of(context).size.height*0.21,
                                crossAxisSpacing: 10.0,
                                childAspectRatio: 2.3/3

                            ),),
                        )
                      ],

                    ));
              }
              if(state is LoadCarsInFailure){
                return Center(child: Text(state.errorText),);
              }
              return Center(
                child: IconButton(onPressed: (){
                  context.read<CarsBloc>().add(FetchAllCarsEvent());
                },icon: Icon(Icons.download)),
              );
            },),
        ));
  }
}
