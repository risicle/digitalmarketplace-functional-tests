argsOuter@{...}:
let
  # specifying args defaults in this slightly non-standard way to allow us to include the default values in `args`
  args = rec {
    pkgs = import <nixpkgs> {};
    localOverridesPath = ./local.nix;
  } // argsOuter;
  bundler = args.pkgs.buildRubyGem rec {
    ruby = args.pkgs.ruby;
    name = "${gemName}-${version}";
    gemName = "bundler";
    version = "2.0.1";
    source.sha256 = "1sjnfsyw80g56kj96gdfgxfb793h6d5fyyir4zf2x71wk4wq1qy7";
    dontPatchShebangs = true;

    postFixup = ''
        sed -i -e "s/activate_bin_path/bin_path/g" $out/bin/bundle
    '';
  };
  bundix = args.pkgs.bundix.override { inherit bundler; };
in (with args; {
  digitalMarketplaceFunctionalTestsEnv = (
    (pkgs.bundlerEnv {
      name = "digitalmarketplace-functional-tests-bundler-env";

      ruby = pkgs.ruby;
      gemfile = ./Gemfile;
      lockfile = ./Gemfile.lock;
      gemset = ./gemset.nix;
    }).env.overrideAttrs (oldAttrs: oldAttrs // rec {
      name = "digitalmarketplace-functional-tests-env";
      shortName = "dm-func-tst";
      buildInputs = [
        bundix
        pkgs.libxml2
        pkgs.phantomjs2
        ((import ./aws-auth.nix) (with pkgs; { inherit stdenv fetchFromGitHub makeWrapper jq awscli openssl; }))
      ];

      # if we don't have this, we get unicode troubles in a --pure nix-shell
      LANG="en_GB.UTF-8";

      shellHook = ''
        export PS1="\[\e[0;36m\](nix-shell\[\e[0m\]:\[\e[0;36m\]${shortName})\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0m\]\[\e[0;36m\]\w\[\e[0m\]\$ "
      '';
    })
  ).overrideAttrs (if builtins.pathExists localOverridesPath then (import localOverridesPath args) else (x: x));
})
