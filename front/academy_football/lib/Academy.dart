import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';


class Academy extends StatefulWidget {
  @override
  _AcademyState createState() => _AcademyState();
}
class _AcademyState extends State<Academy>{

  final PageController _controller = PageController();
  final List<String> imageUrls = [
    'images/logo.png',
    'data:image/jpeg;base64,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',
    'https://us.123rf.com/450wm/matimix/matimix2011/matimix201100031/159317835-camp-d-entra%C3%AEnement-de-football-pour-enfants-gar%C3%A7ons-jeune-entra%C3%AEneur-de-football-expliquant-les.jpg?ver=6',
    'https://cdn.xxl.thumbs.canstockphoto.fr/education-expliquer-gosses-%C3%A9coute-team-practice-%C3%A9quipe-enfants-formation-%C3%A9cole-physique-photos-sous-licence_csp80044435.jpg',
    'https://www.francebleu.fr/s3/cruiser-production/2018/07/741dc891-2f4c-4e31-a925-ded2fb164570/1200x680_000_17o96a.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw0kZct-f351HzYnPOT0zvgFo965ckIhsOXfZU27PSyix2ieUvckPF9w-7khX4fCRshk4&usqp=CAU',
  ];


  final List<String> imageDescriptions = [
    "Bienvenue sur la page À Propos de Nous de l'Académie de Football ! "
        ""
        "Notre académie est dédiée à l'enseignement et à la pratique du football de manière professionnelle, tout en mettant l'accent sur l'épanouissement personnel et la création d'une communauté de joueurs passionnés. Nous sommes convaincus que le football peut aider les jeunes à développer leur confiance en soi, leur esprit d'équipe, leur persévérance et leur discipline, tout en leur offrant une expérience amusante et enrichissante.",

   "Notre équipe d'entraîneurs expérimentés est composée de professionnels qualifiés et passionnés, qui ont une vaste expérience dans la formation de joueurs de football de tous niveaux. Nous sommes fiers d'offrir un environnement d'apprentissage stimulant, où les joueurs peuvent développer leurs compétences techniques, tactiques et physiques, tout en acquérant une compréhension approfondie du jeu et de ses règles.",
    "Nous offrons une variété de programmes de football pour les enfants et les adolescents de tous âges et de tous niveaux, du débutant au joueur expérimenté. Nos programmes comprennent des séances d'entraînement régulières, des stages d'été, des compétitions locales et internationales, ainsi que des camps de formation résidentiels pour les joueurs les plus sérieux.",
    "Nous sommes engagés à fournir un environnement sûr, inclusif et respectueux pour tous nos joueurs, et nous encourageons la participation de tous, quelles que soient leurs origines, leurs aptitudes ou leurs capacités. Nous sommes fiers de faire partie de la communauté du football, et nous espérons vous accueillir bientôt dans notre académie.",
    " N'hésitez pas à nous contacter si vous avez des questions ou si vous souhaitez en savoir plus sur notre académie de football.",
                       "                 L'équipe de l'Académie de Football.",
  ];
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPageIndex = _controller.page?.round() ?? 0;
      });
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // this is to bring the row text in center
            children: <Widget>[

              Text(" About  ",
                style: TextStyle(
                    color: Colors.red
                ),
              ),

              Text("Our Academy  ",
                style: TextStyle(
                    color: Colors.white
                ),
              ),

            ],

          ),

        ),


        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: imageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          imageUrls[index],
                          height: 200, // spécifie la hauteur maximale pour l'image
                          fit: BoxFit.cover, // spécifie comment l'image doit être ajustée à la taille maximale
                          width: double.infinity, // spécifie la largeur maximale pour l'image
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          imageDescriptions[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}