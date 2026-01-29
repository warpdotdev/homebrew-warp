cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.28.08.14.stable_01"
  sha256 arm:   "f45611a1aaac94de887d83da9177dad110b05bf8608de3881d574b0f3e5dae85",
         intel: "97fdd87f0ab0b31eca5734242c277bd32b98dc050da5f70c691891e412ea7a10"

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
