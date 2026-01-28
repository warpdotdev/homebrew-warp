cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.21.08.14.stable_05"
  sha256 arm:   "666b5aced1eecc616f3e1298f29cd55cc686b0501a3e62368c164c3f3679f790",
         intel: "9910aba8ef0cfc06b947d334ce88c8f2d7a6df7df1afe5219390a6df7ef3b633"

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
