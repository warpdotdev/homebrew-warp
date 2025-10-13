cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.08.08.12.stable_04"
  sha256 arm:   "bcc6d28497e3c8f22cb8debb64347aea8ff34be93c2fc31676b4bfd448810162",
         intel: "54f2feabbb8f43a762a6ad191e9bcc4cd123d7bad7a1bf8ecd1313182ca88fa5"

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
