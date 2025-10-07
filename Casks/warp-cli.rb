cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.01.08.12.stable_02"
  sha256 arm:   "ca906da7634b108706da838c1c753867f8db7a7a2895d75fbaa26b43e8489ebc",
         intel: "a223785740a994f2d9d6a61f25fbe525673a67598af157d0ac91e49993789a98"

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

  binary "warp-stable", target: "warp"
end
