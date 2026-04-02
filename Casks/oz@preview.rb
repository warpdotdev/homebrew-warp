cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.01.08.39.preview_01"
  sha256 arm:   "ea0a8fbb0c72a08b9786692e1ecca0ac28e407f06c6a8eb8341f8b552068ed86",
         intel: "e642c6779f964ea1158357e54d965b217b7e322c58437de70cf83229eb3a6c86"

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
