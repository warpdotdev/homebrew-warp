cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.15.08.12.stable_01"
  sha256 arm:   "4f4d83b769d0890323a6bde7421b453e93b5c2eaa0b7e72065590d1329b4f804",
         intel: "043cf906270a8e3e7838110c6af0716f4321d1146b827b833dcc91187025f332"

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
