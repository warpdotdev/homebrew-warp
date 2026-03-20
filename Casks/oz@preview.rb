cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.03.18.08.24.preview_02"
  sha256 arm:   "cfecc81828fdcc8fc4865a12a86e0b0ec537bdeee8e56e454a5035dcc8743fab",
         intel: "3b45fcbfc908c00dc7c2c648f0a7f62099f6c1701452e790590ad0040a9a793d"

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
