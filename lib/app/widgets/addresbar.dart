import 'package:ecommerce_app/components/declarations.dart';
import 'package:ecommerce_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({super.key});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return  Container(
      alignment: Alignment.centerLeft,
      height: 40,
      decoration: const BoxDecoration(
        gradient: Declarations.appBarGradient2
      ),
      padding: const EdgeInsets.only(left: 10,),
      child: Row(
        children: [
          const Icon(Icons.location_on,size: 20,),
          Expanded(child:
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text("${AppLocalizations.of(context)!.addressOf} ${user.name} ${user.address}",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis
              ),

            ),
          ),
          ),

        ],
      ),
    );
  }
}
