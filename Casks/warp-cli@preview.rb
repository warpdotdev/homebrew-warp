cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.08.08.12.preview_04"
  sha256 arm:   "bc8613d0feca30d2cb8341da22af2b1385ef29dabacfb83ffae6a63161504349",
         intel: "567bde0104fcbce2946462f9697781b299b8ebfd9c8c71967addd7600dcde4aa"

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
