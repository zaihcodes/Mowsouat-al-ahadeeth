import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerWidget extends StatelessWidget {
  final String title;
  final String subTitl;
  final bool hasBacNavigator;
  const BannerWidget(
      {super.key,
      required this.title,
      required this.subTitl,
      this.hasBacNavigator = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        hasBacNavigator
            ? Positioned(
                top: 40,
                left: 30,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .shadow
                                .withOpacity(0.2),
                            offset: const Offset(2, 1),
                            blurRadius: 5,
                            spreadRadius: 2,
                          )
                        ]),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 18,
                    ),
                  ),
                ))
            : const SizedBox(),
        SizedBox(
          height: 250,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    subTitl,
                    style: GoogleFonts.almarai().copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.almarai().copyWith(
                        fontSize: 35, overflow: TextOverflow.ellipsis),
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
