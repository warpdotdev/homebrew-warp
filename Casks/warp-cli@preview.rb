cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.14.08.15.preview_01"
  sha256 arm:   "56237e1ec2bfef07c4db85b3ff96063a72aed6f79807614935e9ecc147ee01b8",
         intel: "cc36558e69df7f95b5b5fdc08bbeefb18e7d0b1ea079674160d4be3427b1b34c"

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

  depends_on macos: ">= :sonoma"

  binary "warp-preview"
end
