cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.08.08.12.stable_05"
  sha256 arm:   "9c8a3fa4c023dab10b9cb28977797fd6711cda2a8fcc975c4c1cd3117e5a3002",
         intel: "5ae7374228ba5ac4dab7e3c1acd462cee64854a51c432ffe918be45ca30fbfa1"

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
