{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }:
  let 
    systems = ["x86_64-linux" "aarch64-darwin"];
    gen = nixpkgs.lib.genAttrs;
  in
  {
    devShells = gen systems (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nodejs_24
            nodePackages.pnpm
            playwright-driver.browsers
          ];
          shellHook = ''
            echo "entered devShell"

            export PATH="node_modules/.bin:$PATH"

            # playwrightにNixのパスを渡す
            export PLAYWRIGHT_BROWSERS_PATH=${pkgs.playwright-driver.browsers}
            export PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=true
            export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=true
          '';
        };
      }
    );
  };
}