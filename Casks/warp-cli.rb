cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.29.08.12.stable_02"
  sha256 arm:   "f2a2d405bd72cbd746c70066f4e3dfaf45fca9569c32d89cfb00575c377b41e8",
         intel: "d60194e35b163753b14579319254eaeb3e1b0791731f4ca9ca0e2e8103b164ad"

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
