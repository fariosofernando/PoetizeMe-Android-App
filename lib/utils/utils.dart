class AvatarAssetTransform {
  static AvatarAssets transformFromPath(String path) {
    switch (path) {
      case "assets/img/heidi.png":
        return AvatarAssets.heidi;

      case "assets/img/anonimay.png":
        return AvatarAssets.anonimay;

      case "assets/img/docto_who.jpg":
        return AvatarAssets.doctorWho;

      case "assets/img/golen.jpg":
        return AvatarAssets.golen;

      case "assets/img/mares.png":
        return AvatarAssets.mares;

      case "assets/img/sheila.png":
        return AvatarAssets.sheila;

      default:
        throw "Nenhum avatar foi encontrado no caminho $path";
    }
  }
}

enum AvatarAssets {
  heidi("assets/img/heidi.png"),
  anonimay("assets/img/anonimay.png"),
  doctorWho("assets/img/docto_who.jpg"),
  golen("assets/img/golen.jpg"),
  mares("assets/img/mares.png"),
  sheila("assets/img/sheila.png");

  final String asset;
  const AvatarAssets(this.asset);
}

enum AnimationAsset {
  chat("assets/img/chating.png"),
  fallback("assets/img/fallback.png"),
  idea("assets/img/init.png"),
  search("assets/img/search.png"),
  go("assets/img/start.png");

  final String value;
  const AnimationAsset(this.value);
}
