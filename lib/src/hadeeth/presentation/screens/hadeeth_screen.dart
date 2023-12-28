import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadeeth/src/hadeeth/presentation/blocs/hadeeth/hadeeth_bloc.dart';

class HadeethScreen extends StatelessWidget {
  const HadeethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: BlocBuilder<HadeethBloc, HadeethState>(
          builder: (context, state) {
            if (state is HadeethLoading) {
              return const SizedBox(
                  child: Center(
                      child: CircularProgressIndicator(
                color: Colors.black,
              )));
            } else if (state is HadeethLoaded) {
              return Center(
                child: Text(
                  state.hadeeth.hadeeth,
                  style: GoogleFonts.changa(),
                ),
              );
            } else if (state is HadeethError) {
              return Center(
                child: Text('Error: ${state.message}'),
              );
            } else {
              return const Center(
                child: Text('Unexpected state'),
              );
            }
          },
        ));
  }
}
