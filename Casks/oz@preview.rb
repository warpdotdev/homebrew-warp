cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.08.08.36.preview_01"
  sha256 arm:   "1c5e0df11f01dc33358e8320fa2522285517fa214b8d3c5eed46aa2c74880bce",
         intel: "0938eebb11ae31abc67a63389a2489bbe1d8402a20e05c925e762429c6bcc690"

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
