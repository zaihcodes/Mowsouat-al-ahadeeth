import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class BannerWidget extends StatelessWidget {
//   final String title;
//   final String subTitl;
//   final bool hasBacNavigator;
//   const BannerWidget(
//       {super.key,
//       required this.title,
//       required this.subTitl,
//       this.hasBacNavigator = false});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Stack(
//       children: [
//         Container(
//           height: 200,
//           decoration: BoxDecoration(
//             color: theme.colorScheme.primaryContainer,
//             borderRadius:
//                 const BorderRadius.vertical(bottom: Radius.circular(30)),
//           ),
//           width: double.infinity,
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     subTitl,
//                     style: GoogleFonts.almarai().copyWith(fontSize: 18),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     title,
//                     style: GoogleFonts.almarai().copyWith(
//                         fontSize: 30, overflow: TextOverflow.ellipsis),
//                   ),
//                 ]),
//           ),
//         ),

//         //   Back button
//         hasBacNavigator ? buildBackButton(context) : const SizedBox(),
//       ],
//     );
//   }

//   Positioned buildBackButton(BuildContext context) {
//     return Positioned(
//         top: 40,
//         left: 30,
//         child: InkWell(
//           onTap: () => Navigator.pop(context),
//           child: Container(
//             height: 30,
//             width: 30,
//             decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primaryContainer,
//                 borderRadius: BorderRadius.circular(8),
//                 boxShadow: [
//                   BoxShadow(
//                     color:
//                         Theme.of(context).colorScheme.shadow.withOpacity(0.2),
//                     offset: const Offset(0, 2),
//                     blurRadius: 5,
//                   )
//                 ]),
//             child: Icon(
//               Icons.arrow_back,
//               size: 18,
//               color: Theme.of(context).colorScheme.onPrimaryContainer,
//             ),
//           ),
//         ));
//   }
// }

class BannerWidget extends StatelessWidget {
  final String title;
  final String subTitl;
  final bool hasBacNavigator;

  const BannerWidget({
    super.key,
    required this.title,
    required this.subTitl,
    this.hasBacNavigator = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Card(
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          margin: const EdgeInsets.only(bottom: 0),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Text(
                  //   subTitl,
                  //   style: GoogleFonts.almarai(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                  // const SizedBox(height: 5),
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.almarai(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Back button
        // hasBacNavigator ? buildBackButton(context) : const SizedBox(),
      ],
    );
  }

  Positioned buildBackButton(BuildContext context) {
    return Positioned(
      top: 40,
      left: 30,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 5,
              ),
            ],
          ),
          child: Icon(
            Icons.arrow_back,
            size: 20,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
