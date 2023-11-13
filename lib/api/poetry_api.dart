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
      }
    ];

    // if (response.statusCode == 200) {
    for (var poetry in data) {
      poetrys.add(PoetryModel.fromJson(poetry));
    }

    return Result.success(poetrys);
    // } else {
    //   return Result.failure(data.toString());
    // }
  }
}
