cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.24.09.19.preview_04"
  sha256 arm:   "40ca127cc81615c9005d946df90607223576b574cddda579360bc835f84ad6a3",
         intel: "054aae1b8d7dca8d5fa65d136adc839ea42b77e2efeab36181e47dfa0372500a"

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
