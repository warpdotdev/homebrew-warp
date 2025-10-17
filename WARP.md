# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository Overview

This is a Homebrew tap for Warp CLI formulae. It provides two casks:
- `warp-cli`: Stable release of the Warp CLI
- `warp-cli@preview`: Preview release of the Warp CLI

## Architecture

### Cask Structure
Both casks follow the same pattern:
- Support multi-architecture (arm64/aarch64 and x86_64/intel)
- Version format: `0.YYYY.MM.DD.HH.MM.channel_NN` (e.g., `0.2025.10.01.08.12.stable_02`)
- SHA256 checksums for both architectures
- Download from `https://app.warp.dev/download/cli` with query parameters
- Automated version checking via livecheck using `https://releases.warp.dev/channel_versions.json`

### Binary Installation
- Stable cask: Installs `warp-stable` binary as `warp`
- Preview cask: Installs `warp-preview` binary (name unchanged)

### CI/CD Workflows

**tests.yml**: Runs on push to main and PRs
- Tests on macOS 13 and 15
- Uses Homebrew's `brew test-bot` for validation
- Runs tap syntax checks and formula tests
- Uploads bottle artifacts for PRs

**publish.yml**: Triggered by `pr-pull` label on PRs
- Uses Homebrew's `brew pr-pull` to merge bottles
- Automatically pushes to main branch
- Cleans up feature branches after merge

## Common Development Tasks

### Testing Cask Changes Locally
```bash
brew install --cask --debug warpdotdev/warp/warp-cli
```

### Uninstalling for Testing
```bash
brew uninstall --cask warp-cli
# or
brew uninstall --cask warp-cli@preview
```

### Validating Cask Syntax
```bash
brew audit --cask --strict Casks/warp-cli.rb
brew style Casks/warp-cli.rb
```

### Updating Version and SHA256

1. Update the `version` field in the cask file
2. Calculate new SHA256 checksums:
   ```bash
   # For ARM
   curl -L "https://app.warp.dev/download/cli?os=macos&package=tar&arch=aarch64&version=v<VERSION>" | shasum -a 256
   
   # For Intel
   curl -L "https://app.warp.dev/download/cli?os=macos&package=tar&arch=x86_64&version=v<VERSION>" | shasum -a 256
   ```
3. Update both `arm` and `intel` SHA256 values
4. Test the installation locally before committing

### Release Process

Version bumps follow this pattern (based on git history):
1. Create a PR with branch name like `bump-warp-cli-<VERSION>`
2. Update version and SHA256s in the appropriate cask file(s)
3. CI will automatically test on multiple macOS versions
4. After PR approval, add `pr-pull` label to trigger automated merge

### Branch Naming Convention
- Version bumps: `bump-warp-cli-<VERSION>` or `bump-warp-cli@preview-<VERSION>`
- Feature work: `<username>/<feature-description>`

## Important Notes

- **Never push directly to main** - all changes go through PRs
- **Version format is critical** - must match the pattern recognized by livecheck
- **Both architectures must be updated together** - ensure ARM and Intel builds are from the same release
- **SHA256 verification is mandatory** - Homebrew will reject incorrect checksums
- The main Warp application (`brew install --cask warp`) lives in the official [homebrew-cask repository](https://github.com/Homebrew/homebrew-cask), not here
