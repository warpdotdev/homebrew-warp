cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.03.04.08.22.preview_03"
  sha256 arm:   "8720e9032b517a2fc276ea2eab7080150a814eee8656328fa6fc2d98d047a15d",
         intel: "9f7ec6a56dae9fe5f070a850ca8c5aee5066a87301cc23696aa9aa04ddb98edf"

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
