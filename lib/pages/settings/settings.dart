





import 'package:flutter/material.dart';
import 'package:movie_appp/app_colors.dart';
import 'package:movie_appp/app_provider/app_provider.dart';
import 'package:movie_appp/pages/init_route/init_route.dart';
import 'package:movie_appp/pages/watch_list/watch_list_view.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    List<String> language=[
      AppLocalizations.of(context)!.english,
      AppLocalizations.of(context)!.arabic,
    ];
    List<String> languageCode=[
      'en','ar'
    ];
    return Scaffold(
      appBar: AppBar(leading: InkWell(onTap: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => InitRoute(),
          ),
        );
      },
      child: const Icon(Icons.arrow_back)),
        title: Text(AppLocalizations.of(context)!.settings,style:TextStyle(color:AppColors.whiteColor),
      ),
      centerTitle: true,
      ),
      body: Container(
          child: Center(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(AppLocalizations.of(context)!.lan,textAlign: TextAlign.start,style: TextStyle(fontSize:26),),
                  SizedBox(height: 10,),
                  Center(
                    child: DropdownMenu(
                        width: 250,
                        initialSelection:language[languageCode.indexOf(provider.appLanguage)],
                        onSelected: ((value){
                          if(value!=null) {
                            provider.changeLanguage(
                                languageCode[language.indexOf(value)]);

                          }
                        }),

                        dropdownMenuEntries:language.map((lang){
                          return DropdownMenuEntry(value: lang, label: lang);
                        }).toList()
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );




  }
}



