cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.01.08.39.preview_02"
  sha256 arm:   "13a2b491b9f2735e038962e36b6e36568508b4751ae4ec32c829fdd63d409f8d",
         intel: "7110d63735e12d23f5e3d27a7184c6f86fad3aa7115e5c82c4ec68d145ac8610"

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
