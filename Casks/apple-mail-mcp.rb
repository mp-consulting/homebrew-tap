cask "apple-mail-mcp" do
  version "0.6.3"
  sha256 "16ffcf57ebef7ad264b1f459027ffd2b2e8c7a5107a4db98cb44deb26758654c"

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
  binary "#{appdir}/Apple Mail MCP.app/Contents/Helpers/Apple Mail MCP Server.app/Contents/MacOS/apple-mail-mcp"

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
