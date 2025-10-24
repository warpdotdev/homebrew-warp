cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.22.08.13.stable_02"
  sha256 arm:   "03ccf574b088b27c7221f3e17dbc467fb6b590fb16c6710d05d4a6b6d194e806",
         intel: "c310186d3bbf07c55a2ff13b7c05831c84213b1c4fc90a9933b2b16c9fdf123c"

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
