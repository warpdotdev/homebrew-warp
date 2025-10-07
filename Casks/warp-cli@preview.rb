cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.07.18.16.preview_00"
  sha256 arm:   "41048cb9a3a16e4e4f09373687ee7925350f1f7e8c6e3cfe1349fe6775786cff",
         intel: "30269e5ed5e15a58585ac98fd25e1f88ef0c6ae3ae66d688b3593c9bd7075c21"

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
