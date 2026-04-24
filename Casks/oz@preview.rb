cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.23.19.42.preview_02"
  sha256 arm:   "af235e7d792bacf06bdf8389190bbf8d6c0a3f653dc1ac589b50bdfae62bc005",
         intel: "efe1f239f31a7c05a8c42235ae2a7367656266e1289620e6a892364515feabf0"

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
