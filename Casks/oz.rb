cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.27.15.32.stable_03"
  sha256 arm:   "ca15de9620295597c816eef126b1b45b396a40b17bd5a3742cb0ac539fd341be",
         intel: "161f977d667ab060d6b1f14156d44e68d8957e466a592fe5a0569306745f08ed"

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
