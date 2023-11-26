import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'components/avatar_component.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ValueNotifier<AvatarAssets> _profileAvatar = ValueNotifier<AvatarAssets>(AvatarAssets.heidi);

  @override
  void dispose() {
    _profileAvatar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            ValueListenableBuilder(
              valueListenable: _profileAvatar,
              builder: (context, _, __) {
                return Avatar(
                  onTap: () => showAvatars(),
                  avatar: _profileAvatar.value,
                  width: 120,
                  height: 120,
                  addNewPhotoProfile: true,
                );
              },
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                enabled: false,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "E-mail",
                  suffixIcon: Icon(Icons.alternate_email_outlined),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: true,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(Icons.warning_amber_outlined, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          "Endereço de e-mail não verificado",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                maxLength: 10,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Nickname",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: _validateFirstName,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FilledButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Salvar alterações"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String? _validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o seu primeiro nome';
    }
    if (value.length < 3) {
      return 'O primeiro nome deve ter mais de 2 caracteres';
    }
    return null;
  }

  void showAvatars() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierLabel: 'Selecione o seu avatar',
      builder: (ctx) {
        return SizedBox(
          height: MediaQuery.of(ctx).size.height * .65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 50, top: 50),
                child: Text(
                  "Identifique-se, jovem Padawan.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25.0,
                    crossAxisSpacing: 25.0,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (ctx, index) {
                    return Avatar(
                      border: (_profileAvatar.value == AvatarAssets.values[index]),
                      onTap: () {
                        _profileAvatar.value = AvatarAssets.values[index];
                        Navigator.pop(context);
                      },
                      height: 120,
                      width: 120,
                      avatar: AvatarAssets.values[index],
                    );
                  },
                  itemCount: 5, // número total de avatares
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
