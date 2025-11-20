cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.19.08.12.stable_01"
  sha256 arm:   "157bd9914cb66d0f7445b6237d3f0ffbc5431ac659a5ef855046dc99b4f051e7",
         intel: "b930af86a7a8c8f1f602feb211cb4a648c3d4aed216480d0bbef4d45f3576472"

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
