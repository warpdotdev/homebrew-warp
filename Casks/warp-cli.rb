cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.12.03.08.12.stable_03"
  sha256 arm:   "d319b7c0f5daf8419cdf042a7eb72d3213e3bbe5f811238c836e5105f1cfb584",
         intel: "76950b4d3f5f15f52362adffa37494cf2f42fb462e13e646d6845c75be91d5c3"

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
