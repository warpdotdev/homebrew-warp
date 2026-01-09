cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.07.08.13.stable_01"
  sha256 arm:   "97b7d242e1d69cd7201a144fc812ae389f5eb38650d2c0c69eed9eb9b8957554",
         intel: "9b608d56642750c3d61093faeac1ce039136e4b541c87ac74a23a0e08880d4c2"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Warp CLI"
  desc "Command-line interface to Warp agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("stable", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "warp-stable", target: "warp"
end
