# mp-consulting Homebrew tap

```sh
brew install --cask mp-consulting/tap/apple-mail-mcp
brew install mp-consulting/tap/homebridge-ai-kit
```

| Cask | What it is |
|---|---|
| [`apple-mail-mcp`](Casks/apple-mail-mcp.rb) | [Apple Mail MCP](https://github.com/mp-consulting/apple-mail-mcp): MCP server and menu bar app that lets Claude search, read and answer Apple Mail |

| Formula | What it is |
|---|---|
| [`homebridge-ai-kit`](Formula/homebridge-ai-kit.rb) | [Homebridge AI Kit](https://github.com/mp-consulting/homebridge-ai-kit): MCP server that lets Claude and other AI assistants control and manage Homebridge (installed from npm, runs on Homebrew's Node) |

Casks follow their project's latest GitHub release and formulae their latest npm version, automatically (`.github/workflows/update-casks.yml`).
