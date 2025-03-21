{ 
  config,
  pkgs,
  pkgs-legacy,
  ... }:

{
  home.packages = with pkgs; [
    javaPackages.openjfx23
    davmail
    pkgs-legacy.mu
  ];

  programs.mbsync.enable = true;

  accounts.email = {
    maildirBasePath = "mbsync";
    accounts = {
      puj = {
        address = "je.gomezm@javeriana.edu.co";
        userName = "je.gomezm@javeriana.edu.co";
        passwordCommand = "echo noImporta";
        primary = true;
        imap = {
          host = "localhost";
          port = 1143;
          tls.enable = false;
        };
        mbsync = {
          create = "imap";
          enable = true;
          expunge = "both";
          extraConfig.account = {
            Timeout = 120;
            AuthMechs = "LOGIN";
          };
          extraConfig.channel = {
            Create = "Near";
            Sync = "All";
          };
          patterns = [ "INBOX" "*" ];
        };
      };
      #** Egpti
      puj-egpti = {
        address = "egpti@javeriana.edu.co";
        userName = "egpti@javeriana.edu.co";
        passwordCommand = "echo noImporta";
        imap = {
          host = "localhost";
          port = 1143;
          tls.enable = false;
        };
        mbsync = {
          create = "imap";
          enable = true;
          expunge = "both";
          extraConfig.account = {
            Timeout = 120;
            AuthMechs = "LOGIN";
          };
          extraConfig.channel = {
            Create = "Near";
            Sync = "All";
          };
          patterns = [ "INBOX" "*" ];
        };
      };

      #** AES
      puj-aes = {
        address = "aes@javeriana.edu.co";
        userName = "aes@javeriana.edu.co";
        passwordCommand = "echo noImporta";
        imap = {
          host = "localhost";
          port = 1143;
          tls.enable = false;
        };
        mbsync = {
          create = "imap";
          enable = true;
          expunge = "both";
          extraConfig.account = {
            Timeout = 120;
            AuthMechs = "LOGIN";
          };
          extraConfig.channel = {
            Create = "Near";
            Sync = "All";
          };
          patterns = [ "INBOX" "*" ];
        };
      };
      gmail-jee = {
        address = "juanerasmoe@gmail.com";
        userName = "juanerasmoe@gmail.com";
        passwordCommand = "gpg2 -q --for-your-eyes-only --no-tty -d ~/.config/emacs/.mbsyncpass-jee.gpg";
        imap = {
          host = "imap.gmail.com";
          tls.enable = true;
        };
        mbsync = {
          enable = true;
          create = "both";
          expunge = "both";
          extraConfig.account = {
            Timeout = 120;
            AuthMechs = "PLAIN";
            SSLType = "IMAPS";
            SSLVersion = "TLSv1.3";
          };
          extraConfig.channel = {
            Create = "Near";
            Sync = "All";
          };
          patterns = [ "INBOX" "*" ];
        };
      };
    };
  };
}

