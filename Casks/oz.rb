cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.30.08.29.stable_02"
  sha256 arm:   "e277d9aea6f73f7f67a39bae8b8bd74aaee51e0929f7ddac5b5534d7548330e5",
         intel: "07b87473785a2c45825ee753c03b7c22c102910270095c4e75ea907a1e9bd557"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      (json.dig("stable", "cli_version") || json.dig("stable", "version"))&.delete_prefix("v")
    end
  end

  depends_on macos: :sonoma

  binary "oz-stable", target: "oz"
end
