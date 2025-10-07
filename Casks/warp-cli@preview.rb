cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.01.08.12.preview_02"
  sha256 arm:   "fcb8d6020259f4c3f371f7c089dfadbc4c7d88ae64807472db83955774f12545",
         intel: "40f7cce142f2477ac7eeb65b201efb80d55e58146452291e3405ff66b3986aa1"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Warp CLI (Preview)"
  desc "Command-line interface to Warp agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("preview", "version")&.delete_prefix("v")
    end
  end

  binary "warp-preview"
end
