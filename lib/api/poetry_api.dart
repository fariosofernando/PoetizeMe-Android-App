import 'package:poetizeme/api/configs_api.dart';
import 'package:poetizeme/utils/result.dart';

import '../models/poetry_model.dart';

class Poetry {
  final APIConfigs configs;

  Poetry(this.configs);

  Future<Result<List<PoetryModel>>> getAll() async {
    List<PoetryModel> poetrys = [];

    // final response = await http.get(configs.poetrys);

    // List data = jsonDecode(response.body);

    const List data = [
      {
        "id": "3fccfc35-7fde-4b6c-bc33-7784f44c6fba",
        "title": "⁠UM POEMA",
        "content": "Todo o amor qual andei sempre embebido... Pulsa no peito ao dizer-te em verso terno... O que sempre no meu amar teve contido (...)",
        "createdAt": "2023-10-24T05:02:50.044Z",
        "tags": ["Amor"],
        "authorId": "3bbefcaf-9ccd-4c2d-8654-60bdef2bb4c8",
        "author": {"id": "3bbefcaf-9ccd-4c2d-8654-60bdef2bb4c8", "username": "Farioso", "email": null, "biography": "Biografia...", "profilePhoto": null, "createdAt": "2023-10-23T13:20:27.538Z"},
        "likes": [
          {"id": "9973747e-f5a2-4dcb-8979-3686e9acb4d7", "poetryId": "3fccfc35-7fde-4b6c-bc33-7784f44c6fba", "authorId": "c3a99d93-0f05-47d8-9633-6b4052d8c9cb"},
          {"id": "c3ca1d65-ae64-490e-a634-e954c99f9ab7", "poetryId": "3fccfc35-7fde-4b6c-bc33-7784f44c6fba", "authorId": "3bbefcaf-9ccd-4c2d-8654-60bdef2bb4c8"}
        ]
      },
      {
        "id": "b0fea8a6-fa25-4063-bd9f-ef823b8ca694",
        "title": "Ideia",
        "content": "Uma simplicidade infinita da ideia...",
        "createdAt": "2023-10-24T05:14:52.220Z",
        "tags": ["Pensamento"],
        "authorId": "3bbefcaf-9ccd-4c2d-8654-60bdef2bb4c8",
        "author": {"id": "3bbefcaf-9ccd-4c2d-8654-60bdef2bb4c8", "username": "Farioso", "email": null, "biography": "Biografia...", "profilePhoto": null, "createdAt": "2023-10-23T13:20:27.538Z"},
        "likes": []
      },
      {
        "id": "52931fee-a216-4917-9b82-dd7552bfb6db",
        "title": "Sentido",
        "content": "Um poema de minha autoria, as vezes sem sentido algum...",
        "createdAt": "2023-10-24T05:50:39.736Z",
        "tags": ["Pensamento"],
        "authorId": "3bbefcaf-9ccd-4c2d-8654-60bdef2bb4c8",
        "author": {"id": "3bbefcaf-9ccd-4c2d-8654-60bdef2bb4c8", "username": "Farioso", "email": null, "biography": "Biografia...", "profilePhoto": null, "createdAt": "2023-10-23T13:20:27.538Z"},
        "likes": []
      },
      {
        "id": "b0965a45-1092-4e8f-9650-f72e0e16c14c",
        "title": "Sentido",
        "content": "Escrevo de varias formas, as vezes sem pensamento algum... mas sempre me encontro lá.",
        "createdAt": "2023-11-09T00:38:10.142Z",
        "tags": ["Pensamento"],
        "authorId": "7343a7ef-d2d3-4213-95eb-dd7050ea1839",
        "author": {"id": "7343a7ef-d2d3-4213-95eb-dd7050ea1839", "username": "Aurelio Fernam", "email": null, "biography": "Biografia...", "profilePhoto": null, "createdAt": "2023-11-09T00:24:25.476Z"},
        "likes": []
      },
      {
        "id": "5077630b-e735-4e25-a17e-bd1c1a5e6911",
        "title": "Timidez (Cecília Meireles)",
        "content":
            "Basta-me um pequeno gesto,\nfeito de longe e de leve,\npara que venhas comigo\ne eu para sempre te leve…\n– mas só esse eu não farei.\nUma palavra caída\ndas montanhas dos instantes\ndesmancha todos os mares\ne une as terras mais distantes…\n– palavra que não direi.\nPara que tu me adivinhes,\nentre os ventos taciturnos,\napago meus pensamentos,\nponho vestidos noturnos,\n– que amargamente inventei.\nE, enquanto não me descobres,\nos mundos vão navegando\nnos ares certos do tempo,\naté não se sabe quando…\n– e um dia me acabarei.",
        "createdAt": "2023-11-13T03:33:56.930Z",
        "tags": ["Amor"],
        "authorId": "8a3d84e1-2ce3-4eeb-ba4d-b063861b2e8f",
        "author": {"id": "8a3d84e1-2ce3-4eeb-ba4d-b063861b2e8f", "username": "vernicapeanha", "email": null, "biography": "Biografia...", "profilePhoto": null, "createdAt": "2023-11-13T03:29:53.232Z"},
        "likes": [
          {"id": "2b3adce2-be6d-456f-a3d4-23fcedccebd0", "poetryId": "5077630b-e735-4e25-a17e-bd1c1a5e6911", "authorId": "8a3d84e1-2ce3-4eeb-ba4d-b063861b2e8f"}
        ]
      },
      {
        "id": "674410a7-462e-431b-a623-ca7e0e2bfbd5",
        "title": "O Frio, A Neblina",
        "content": "...eu gosto do frio, gosto da neve. gosto como ela se parece. sinto vontade de chorar quando a vejo. sinto vontade de escrever quando a vejo.",
        "createdAt": "2023-11-13T03:39:50.827Z",
        "tags": ["Pensamento"],
        "authorId": "8a3d84e1-2ce3-4eeb-ba4d-b063861b2e8f",
        "author": {"id": "8a3d84e1-2ce3-4eeb-ba4d-b063861b2e8f", "username": "vernicapeanha", "email": null, "biography": "Biografia...", "profilePhoto": null, "createdAt": "2023-11-13T03:29:53.232Z"},
        "likes": []
      },
      {
        "id": "2d523ca1-b7c0-4c35-99e6-bf5be4f62c1a",
        "title": "Sou Sozinho",
        "content": "...você um amor solitário. lágrimas... sinto me banhado por elas... tocava um piano.",
        "createdAt": "2023-11-13T03:41:50.381Z",
        "tags": ["Tristeza"],
        "authorId": "8a3d84e1-2ce3-4eeb-ba4d-b063861b2e8f",
        "author": {"id": "8a3d84e1-2ce3-4eeb-ba4d-b063861b2e8f", "username": "vernicapeanha", "email": null, "biography": "Biografia...", "profilePhoto": null, "createdAt": "2023-11-13T03:29:53.232Z"},
        "likes": []
      }
    ];

    // if (response.statusCode == 200) {
    for (var poetry in data) {
      poetrys.add(PoetryModel.fromJson(poetry));
    }

    await Future.delayed(const Duration(seconds: 5));

    return Result.success(poetrys);
    // } else {
    //   return Result.failure(data.toString());
    // }
  }
}
