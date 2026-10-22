cask "apple-calendar-mcp" do
  version "0.3.0"
  sha256 "85936124f0a08b2f3b1f8ec84462784da00112ab237a6f202e4cda186cbff4e8"

  url "https://github.com/mp-consulting/apple-calendar-mcp/releases/download/v#{version}/AppleCalendarMCP-#{version}.dmg"
  name "Apple Calendar MCP"
  desc "MCP server and menu bar app that lets Claude read, search and plan Apple Calendar"
  homepage "https://github.com/mp-consulting/apple-calendar-mcp"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Apple Calendar MCP.app"
  binary "#{appdir}/Apple Calendar MCP.app/Contents/Helpers/Apple Calendar MCP Server.app/Contents/MacOS/apple-calendar-mcp"

  zap trash: [
    "~/Library/Application Support/apple-calendar-mcp",
    "~/Library/Caches/AppleCalendarMCP",
    "~/Library/Preferences/com.mpconsulting.AppleCalendarMCP.plist",
  ]

  caveats <<~EOS
    Open Apple Calendar MCP from Applications, click Allow Calendar Access, then Connect in its Claude tab.
    The app holds the Calendars permission for the server, so keep it running (it can open at login).
  EOS
end
