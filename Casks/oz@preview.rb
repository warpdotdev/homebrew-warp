cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.30.08.29.preview_01"
  sha256 arm:   "ec78717f38be2f5b395eee0f2150a8e413fccd5b6ffd923bf9edfdb1f07a8137",
         intel: "46c6d1661054d1bf55cc0cc60500d124171b2e0b06cf9b7cae00b4ff06302a9c"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz (Preview)"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      (json.dig("preview", "cli_version") || json.dig("preview", "version"))&.delete_prefix("v")
    end
  end

  depends_on macos: :sonoma

  binary "oz-preview"
end
