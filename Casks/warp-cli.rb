cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.29.08.12.stable_01"
  sha256 arm:   "b2a6cd50a1d0c3fcc99cc3beb6dfbbd804cb8747d3cc5ca7ae9f99b493b6b6e3",
         intel: "64f2d2e625ed5c7e2745ffd83424ae6e5df75447a4a049d4fd7a040bce486f29"

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
