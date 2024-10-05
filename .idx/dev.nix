{ pkgs, ... }: {
  channel = "stable-23.11";
  packages = [
    pkgs.jdk17
    pkgs.unzip
  ];
  env = { };
  idx = {
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
      "tenninebt.vscode-koverage"
      "ms-vscode.live-server"
      "ryanluker.vscode-coverage-gutters"
      "github.vscode-github-actions"
      "esbenp.prettier-vscode"
      "jock.svg"
      "GitHub.vscode-pull-request-github"
    ];
    workspace = {
      onCreate = {
        build-flutter = ''
          cd /home/user/myapp/android

          ./gradlew \
            --parallel \
            -Pverbose=true \
            -Ptarget-platform=android-x86 \
            -Ptarget=/home/user/myapp/lib/main.dart \
            -Pbase-application-name=android.app.Application \
            -Pdart-defines=RkxVVFRFUl9XRUJfQ0FOVkFTS0lUX1VSTD1odHRwczovL3d3dy5nc3RhdGljLmNvbS9mbHV0dGVyLWNhbnZhc2tpdC85NzU1MDkwN2I3MGY0ZjNiMzI4YjZjMTYwMGRmMjFmYWMxYTE4ODlhLw== \
            -Pdart-obfuscation=false \
            -Ptrack-widget-creation=true \
            -Ptree-shake-icons=false \
            -Pfilesystem-scheme=org-dartlang-root \
            assembleDebug

          # TODO: Execute web build in debug mode.
          # flutter run does this transparently either way
          # https://github.com/flutter/flutter/issues/96283#issuecomment-1144750411
          flutter build web --profile --dart-define=Dart2jsOptimization=O0 

          adb -s localhost:5555 wait-for-device
        '';
      };
      onStart = { };
    };
    previews = {
      enable = true;
      previews = {
        web = {
          command = [ "flutter" "run" "--machine" "-d" "web-server" "--web-hostname" "0.0.0.0" "--web-port" "$PORT" ];
          manager = "flutter";
        };
        android = {
          command = [ "flutter" "run" "--machine" "-d" "android" "-d" "localhost:5555" ];
          manager = "flutter";
        };

      };
    };
  };
}
