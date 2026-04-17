cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.15.08.45.preview_02"
  sha256 arm:   "4aef874ef8da5260fc018c64df8f0ddd227d2a912e19c2b3d869482c23f482af",
         intel: "2b0b740f58d482f095acf66fc35b617b412ad71ab66f84c7bb6090ca005ba826"

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
