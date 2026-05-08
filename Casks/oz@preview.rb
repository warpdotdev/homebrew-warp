cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.06.15.42.preview_02"
  sha256 arm:   "ca5b4098563a2c2db8f130b39dfc0338c33b2047f7ebaa01a89648656bf3320f",
         intel: "30a982ae0d8da06f855d363d76560c520797029faf39a1d30e182d0a1b568347"

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
