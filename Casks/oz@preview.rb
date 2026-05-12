cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.06.15.42.preview_04"
  sha256 arm:   "2733249d74f66545a73470d5424c1446e5dafe8d2268aa126ff62a493f31f184",
         intel: "dc23459cb146f50779776add273e3291758d5ce4c27d6356b50d9c01438151bc"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz (Preview)"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("preview", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "oz-preview"
end
