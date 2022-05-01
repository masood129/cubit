import 'package:cubit/cubit/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/testcubit_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (BuildContext context) => CounterCubit(),
    child: MaterialApp(
      home: IncreasePage(),
    ),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('CUBIT TEST'),
      ),
      body: BlocConsumer<TestcubitCubit, TestcubitEvent>(
        listener: (context, TestcubitEvent state) {},
        builder: (context, state) {
          if (state is CheckLoginCubit) {
            if (state.login!) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                          value: CounterCubit(),
                          child: IncreasePage(),
                        )),
              );
            }
          }
          return Center(
              child: (state is LoadingScreen)
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              context.read<TestcubitCubit>().login();
                            },
                            icon: const Icon(Icons.login_outlined)),
                        (state is CheckLoginCubit)
                            ? Text('U are Log in ?! : ${state.login}')
                            : Container(
                                height: 100,
                                width: 100,
                                color: Colors.red,
                              ),
                        IconButton(
                            onPressed: () {
                              context.read<TestcubitCubit>().logout();
                            },
                            icon: const Icon(Icons.logout)),
                      ],
                    ));
        },
      ),
    );
  }
}

class IncreasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('LOGED IN'),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<CounterCubit>().increase();
                      },
                      icon: const Icon(Icons.plus_one),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CounterCubit>().decrease();
                        print(state.toString());
                      },
                      icon: const Icon(Icons.exposure_minus_1),
                    ),
                  ],
                ),
                CircleAvatar(
                  child: Text(state.toString()),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
