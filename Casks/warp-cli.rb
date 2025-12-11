cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.12.10.08.12.stable_02"
  sha256 arm:   "bd1a0643f4cf3e1559fa30907f3506ef694721ba59f740b1bbd53a6af2039943",
         intel: "7ca0c42bfa5a42a4287c436f5562dc6a83068df334609f1cf44e96a51f0f7f1a"

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
