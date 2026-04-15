cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.15.08.45.preview_00"
  sha256 arm:   "41e47cdf68e289788eeac263c7007ab4549ab77d736ea479d607557c06ff01c7",
         intel: "412b5441c2bf353b4dfe74c4b2037fdd37033a026202d9e89246e89b420868a6"

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
