import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadeeth/src/category/domain/entities/category_hadeeth.dart';
import 'package:hadeeth/src/hadeeth/presentation/blocs/hadeeth/hadeeth_bloc.dart';
import 'package:hadeeth/src/hadeeth/presentation/screens/hadeeth_screen.dart';

// class CategoryDetailItem extends StatelessWidget {
//   const CategoryDetailItem({
//     super.key,
//     required this.categoryHadeeth,
//   });

//   final CategoryHadeeth categoryHadeeth;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         context
//             .read<HadeethBloc>()
//             .add(GetHadeeth(lang: 'ar', hadeethId: categoryHadeeth.id));
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => const HadeethScreen()));
//       },
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         margin: const EdgeInsets.only(bottom: 10),
//         decoration: BoxDecoration(
//           // color: Theme.of(context).colorScheme.primaryFixedDim,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             width: 2,
//             color: Theme.of(context).colorScheme.primaryFixedDim,
//           ),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 categoryHadeeth.title,
//                 textAlign: TextAlign.end,
//                 style: GoogleFonts.changa(),
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                       color: Theme.of(context).colorScheme.secondaryContainer,
//                       width: 1),
//                 ),
//                 child: const Icon(
//                   Icons.arrow_forward,
//                   size: 14,
//                 )),
//           ],
//         ),
//         // Add more category information as needed
//       ),
//     );
//   }
// }

class CategoryDetailItem extends StatelessWidget {
  const CategoryDetailItem({
    super.key,
    required this.categoryHadeeth,
  });

  final CategoryHadeeth categoryHadeeth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<HadeethBloc>()
            .add(GetHadeeth(lang: 'ar', hadeethId: categoryHadeeth.id));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HadeethScreen()));
      },
      child: Card(
        elevation: 4,
        color: Theme.of(context).colorScheme.secondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  categoryHadeeth.title,
                  textAlign: TextAlign.end,
                  style: GoogleFonts.changa(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    width: 1,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
