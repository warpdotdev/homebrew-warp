cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.01.08.39.stable_02"
  sha256 arm:   "3f78645c8d59f3dacc1c2993c03f61e2ee7b60be387619083619d37032e1102d",
         intel: "24476ce89c95a9021b6680e2a056fcaae1f6792d3fb95627e6d740fb188507e8"

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
