cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.22.08.13.preview_01"
  sha256 arm:   "d483ee9b073f9dc3dc99acb2d0f013aeab33e97272ca42669f6d4d4886341f02",
         intel: "d110acb18a66d8f614100f91ae918f2e1473929222658d570822e2754c47edb0"

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
