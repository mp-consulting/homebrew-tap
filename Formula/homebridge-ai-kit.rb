class HomebridgeAiKit < Formula
  desc "MCP server that lets Claude and other AI assistants control Homebridge"
  homepage "https://github.com/mp-consulting/homebridge-ai-kit"
  url "https://registry.npmjs.org/@mp-consulting/homebridge-ai-kit/-/homebridge-ai-kit-3.1.1.tgz"
  sha256 "c5fe0c6b85249be585e3d60c08500e59d9a0a07e33e3d4c10786d5706cac51be"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/@mp-consulting/homebridge-ai-kit/latest"
    regex(/"version"\s*:\s*"([^"]+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/homebridge-ai-kit"
  end

  def caveats
    <<~EOS
      Add the server to Claude Code:
        claude mcp add homebridge -e HOMEBRIDGE_URL=http://192.168.1.100:8581 \\
          -e HOMEBRIDGE_TOKEN=hbg_… -- #{opt_bin}/homebridge-ai-kit mcp
      For the Claude app, the .mcpb extension on the GitHub releases installs with a double-click.
    EOS
  end

  test do
    assert_match "Usage: homebridge-ai-kit mcp", shell_output("#{bin}/homebridge-ai-kit --help 2>&1")
    output = shell_output("#{bin}/homebridge-ai-kit mcp 2>&1", 1)
    assert_match "HOMEBRIDGE_URL environment variable is required", output
  end
end
