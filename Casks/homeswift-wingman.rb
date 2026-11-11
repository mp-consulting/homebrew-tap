cask "homeswift-wingman" do
  version "0.4.1"
  sha256 "5cc674a3fac27f13b446c6148d2d1193a98d11677bdd572fa64cf6f2dad55394"

  url "https://github.com/mp-consulting/homeswift-wingman/releases/download/v#{version}/HomeswiftWingman-#{version}.dmg"
  name "Homeswift Wingman"
  desc "Menu bar app that serves Apple Home's accessories to Homeswift bridges"
  homepage "https://github.com/mp-consulting/homeswift-wingman"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Homeswift Wingman.app"

  zap trash: [
    "~/Library/Application Support/com.mpconsulting.HomeswiftWingman",
    "~/Library/Preferences/com.mpconsulting.HomeswiftWingman.plist",
  ]

  caveats <<~EOS
    Homeswift Wingman is signed for development (HomeKit is not available to Developer ID apps), so it runs
    only on the Macs registered in its developer's team. macOS asks once before opening it:
      System Settings › Privacy & Security › Open Anyway
    Then allow access to Home data and pair it from Homeswift's Wingman plugin.
  EOS
end
