cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.09.03.08.11.preview_01"
  sha256 arm:   "<placeholder>",
         intel: "<placeholder>"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=standalone&arch=#{arch}&version=v#{version}"
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
