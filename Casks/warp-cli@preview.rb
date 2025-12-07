cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.12.03.08.12.preview_03"
  sha256 arm:   "3353a643bb89e9d5e797c29dfc2ddf16d173a674e7d3ae285f5ec1f1b955db9f",
         intel: "3edb5d03dbd8af7edeed10c8ec5482af58e227561f070b26cac7acadab2bc3cf"

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
