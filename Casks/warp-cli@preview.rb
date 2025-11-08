cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.06.20.04.preview_01"
  sha256 arm:   "21272c19051f4299c0b51140306ba0374392880d11a4574bbc21a337a2fb302b",
         intel: "b1067b1a1c116c6f3d5e042a396ba904824bc6a62f0f131265a0f166dee5b218"

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
