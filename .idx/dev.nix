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
      onCreate = { };
      onStart = {
        start-build-runner = "dart run build_runner build";
      };
    };
    previews = {
      enable = true;
      previews = {
        web = {
          command = [ "flutter" "run" "--machine" "-d" "web-server" "--web-hostname" "0.0.0.0" "--web-port" "$PORT" ];
          manager = "flutter";
        };

      };
    };
  };
}