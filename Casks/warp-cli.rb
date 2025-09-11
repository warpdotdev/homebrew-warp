cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.09.11.08.11.dev_00"
  sha256 arm:   "<placeholder>",
         intel: "<placeholder>"

  url "https://app.warp.dev/download/cli?os=macos&package=standalone&arch=#{arch}&version=v#{version}"
  name "Warp CLI"
  desc "Command-line interface to Warp agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("stable", "version")&.delete_prefix("v")
    end
  end

  binary "warp"
end
