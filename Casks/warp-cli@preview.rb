cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.12.17.17.17.preview_02"
  sha256 arm:   "9f5854a93c5a64a635975f34f60184fa5f35ef0e69e21d5950aea870e88932af",
         intel: "2915c8a97444a839e8deb5a343a89064621d698b7c36708adfce6bdc3f2fbd81"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Warp CLI (Preview)"
  desc "Command-line interface to Warp agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("preview", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "warp-preview"
end
