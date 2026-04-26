cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.23.19.42.preview_03"
  sha256 arm:   "7a7f719a28ffadad1eb49854528deb91fa1ec497136b97ed09d6f96cc6c5d558",
         intel: "1234472a87542f455ef7d11a657d8be14a40cf3faf1263c0dcea1715337e4754"

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
