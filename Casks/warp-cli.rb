cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.08.08.12.stable_03"
  sha256 arm:   "77296f555756a88a2df7b6c7d6ac02bf8081a90f304c6fff82f81c4a1d87ab9e",
         intel: "8dcb49760173193ca230e6e8f6ea2de4fb4f8738349db1281dd102e482bf052a"

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
