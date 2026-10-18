cask "apple-mail-mcp" do
  version "0.4.3"
  sha256 "a7a45028d5cd65175e177ad44c1f5397b394d7a9a53b272b02923ac56e474c43"

  url "https://github.com/mp-consulting/apple-mail-mcp/releases/download/v#{version}/AppleMailMCP-#{version}.dmg"
  name "Apple Mail MCP"
  desc "MCP server and menu bar app that lets Claude search, read and answer Apple Mail"
  homepage "https://github.com/mp-consulting/apple-mail-mcp"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Apple Mail MCP.app"
  binary "#{appdir}/Apple Mail MCP.app/Contents/MacOS/apple-mail-mcp"

  zap trash: [
    "~/Library/Application Support/apple-mail-mcp",
    "~/Library/Caches/apple-mail-mcp",
    "~/Library/Caches/AppleMailMCP",
    "~/Library/Preferences/com.mpconsulting.AppleMailMCP.plist",
  ]

  caveats <<~EOS
    Open Apple Mail MCP from Applications, then click Connect in its Claude tab.
    Give Full Disk Access to the app that runs the server (Claude, your terminal…):
      System Settings › Privacy & Security › Full Disk Access
  EOS
end
