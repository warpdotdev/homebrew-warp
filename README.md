# Warp Homebrew Tap

Looking for the Warp app? It's in the main [homebrew-cask repository](https://github.com/Homebrew/homebrew-cask) and can be installed with `brew install --cask warp`.

## Casks

* `warp-agent-cli`: the stable Warp Agent CLI for macOS and Linux
* `oz`: the stable command-line interface to Oz agents
* `oz@preview`: the Preview command-line interface to Oz agents

## Installation

Install Warp Agent CLI directly:

```shell
brew install --cask warpdotdev/warp/warp-agent-cli
```

Alternatively, tap the repository first:

```shell
brew tap warpdotdev/warp
brew install --cask <cask>
```

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "warpdotdev/warp"
cask "<cask>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
