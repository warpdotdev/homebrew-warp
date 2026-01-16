cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.14.08.15.stable_02"
  sha256 arm:   "c641dcd53dae0c08d144469b4ceb2854a7a8f7c042ac4654351883c1e83e57e8",
         intel: "94e62ce788e005d35b2eb5abc37ebd601d1c28b4c57dd651c8c1663304a0a29c"

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
