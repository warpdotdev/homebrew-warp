cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.04.08.20.stable_02"
  sha256 arm:   "e0dae04d2a3be0135557ae7e94dcac7d3fa1ab6b6195a1ccc31bfdd0ecb2c88b",
         intel: "514120122513e1155bcb1f2b293ca2424079926114fc9d464f062529a106933b"

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
