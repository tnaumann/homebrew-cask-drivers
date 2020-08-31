cask "creative-sb-command" do
  version "11.1.02.04"
  sha256 "d1264448def6d13e94c9465ac67d8b7a473ac9838c519821e3cee443fe43b268"

  url "https://download.creative.com/manualdn/Applications/100300/SEwNEWcs2X/SBCMD_MAC_L#{version.dots_to_underscores}.dmg"
  name "Creative Sound Blaster Command"
  desc "Configure and personalize audio settings of Creative Sound Blaster peripherals"
  homepage "https://support.creative.com/"

  depends_on macos: ">= :sierra"

  pkg "INSTALL.pkg"

  uninstall pkgutil: [
    "com.creative.AudioDriver",
    "com.creative.Uninstaller",
    "com.creative.SBCommand",
  ],
            rmdir:   "/Applications/Creative"

  zap trash: [
    "~/Library/Application Support/Creative.SB-Command",
    "~/Library/Application Support/Creative.SB-Command.logs",
    "~/Library/Preferences/Creative.SB-Command.plist",
  ]

  caveats do
    kext
  end
end
