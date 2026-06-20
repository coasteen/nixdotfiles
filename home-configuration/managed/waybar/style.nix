{ ... }:
{
  programs.waybar.style = ''
    * {
        font-family: "Iosevka Nerd Font";
        font-size: 14px;
    }

    window#waybar {
        background-color: #000000;
        margin: 0;
    }

    #workspaces {
        margin: 8px 0 4px 8px;
    }

    #workspaces button {
        color: #89b4fa;
        background: #16161a;
        margin-right: 6px;
        border-radius: 12px;
        box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.4);
        padding: 4px 12px;
        font-weight: bold;
        transition: all 0.3s ease;
    }

    #workspaces button.active {
        color: #09090F;
        margin-right: 6px;
        border-radius: 12px;
        background: linear-gradient(135deg, #cba6f7, #f9e2af, #a6e3a1, #89b4fa);
        background-size: 200% 200%;
        animation: shift 6s ease infinite;
    }

    @keyframes shift {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    #window {
        color: #d3869b;
        margin: 8px 8px 4px 8px;
        border-radius: 12px;
        box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.4);
        padding: 4px 12px;
        font-weight: bold;
    }

    #cpu,
    #network,
    #wireplumber,
    #battery {
        color: #d3869b;
        background: #16161a;
        margin: 8px 8px 4px 0;
        border-radius: 12px;
        box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.4);
        padding: 4px 12px;
        font-weight: bold;
    }

    #clock {
        background: linear-gradient(135deg, #cdd6f4, #f38ba8);
        background-size: 200% 200%;
        animation: shift 6s ease infinite;
        margin: 8px 8px 4px 0;
        border-radius: 12px;
        padding: 4px 12px;
        color: #09090F;
        font-weight: bold;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
    }

    #taskbar {
        background: #16161a;
        color: #89b4fa;
        margin: 8px 8px 4px 0;
        border-radius: 12px;
        min-width: 38px;
        padding: 3px;
        font-weight: bold;
    }

    #custom-distro-icon {
        background: radial-gradient(circle, rgba(203,166,247,1) 0%, rgba(193,168,247,1) 12%, rgba(249,226,175,1) 19%, rgba(189,169,247,1) 20%, rgba(182,171,247,1) 24%, rgba(198,255,194,1) 36%, rgba(177,172,247,1) 37%, rgba(170,173,248,1) 48%, rgba(255,255,255,1) 52%, rgba(166,174,248,1) 52%, rgba(160,175,248,1) 59%, rgba(148,226,213,1) 66%, rgba(155,176,248,1) 67%, rgba(152,177,248,1) 68%, rgba(205,214,244,1) 77%, rgba(148,178,249,1) 78%, rgba(144,179,250,1) 82%, rgba(180,190,254,1) 83%, rgba(141,179,250,1) 90%, rgba(137,180,250,1) 100%);
        background-size: 400% 400%;
        color: #09090F;
        margin: 8px 4px 4px 8px;
        border-radius: 12px;
        box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.4);
        padding: 0;
        min-width: 34px;
        font-size: 18px;
        font-weight: bold;
    }
  '';
}
