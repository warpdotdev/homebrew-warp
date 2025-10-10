cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.08.08.12.preview_03"
  sha256 arm:   "41a4bfad4586350eeabe5a5127c60a771f664c033c6215ef1b0949c400d718c3",
         intel: "71f48b0b46affc2bda02e20dd74ee3b0289d88e91460f822006b58c40df7cd44"

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
