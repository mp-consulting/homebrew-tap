# mp-consulting Homebrew tap

```sh
brew install --cask mp-consulting/tap/apple-mail-mcp
brew install --cask mp-consulting/tap/apple-calendar-mcp
brew install mp-consulting/tap/homebridge-ai-kit
brew install mp-consulting/tap/homeswift
```

| Cask | What it is |
|---|---|
| [`apple-mail-mcp`](Casks/apple-mail-mcp.rb) | [Apple Mail MCP](https://github.com/mp-consulting/apple-mail-mcp): MCP server and menu bar app that lets Claude search, read and answer Apple Mail |
| [`apple-calendar-mcp`](Casks/apple-calendar-mcp.rb) | [Apple Calendar MCP](https://github.com/mp-consulting/apple-calendar-mcp): MCP server and menu bar app that lets Claude read, search and plan Apple Calendar |

| Formula | What it is |
|---|---|
| [`homeswift`](Formula/homeswift.rb) | [Homeswift](https://github.com/mp-consulting/homeswift): the HomeKit Accessory Protocol in Swift, with a demo HomeKit bridge (built from source, runs with `brew services`) |
| [`homebridge-ai-kit`](Formula/homebridge-ai-kit.rb) | [Homebridge AI Kit](https://github.com/mp-consulting/homebridge-ai-kit): MCP server that lets Claude and other AI assistants control and manage Homebridge (installed from npm, runs on Homebrew's Node) |

Casks and the homeswift formula follow their project's latest GitHub release and the other formulae their latest npm version, automatically (`.github/workflows/update-casks.yml`).
