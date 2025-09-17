cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.09.17.08.11.stable_00"
  sha256 arm:   "80c96b19e09c8c83b3ff42a9509d0e354f3d471eb4b60ef3a2d4653eeecf3477",
         intel: "4b0eed6ff3e473bd47e0518a192f935e2192a7bd6294f66a17fe3bdd2c3f8bdd"

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
