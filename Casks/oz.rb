cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.01.08.39.stable_01"
  sha256 arm:   "4d974370df33746d04cad7fefa237c8aab2a84812ffd52b0ad7608bbf3631168",
         intel: "76e96216a75f629272df5ad0b827c6e384c9638e53cd4c8fd7424599ae66cf4e"

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
