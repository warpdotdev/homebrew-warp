cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.13.09.15.stable_03"
  sha256 arm:   "e4e526e2aed04e4041463dc24d441e27d151245e8091c64b6036e564ab66077f",
         intel: "c724e59100089a14c8ff4a5eed146d8366f5dd62d029db6051723f26291fb5c8"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("stable", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "oz-stable", target: "oz"
end
