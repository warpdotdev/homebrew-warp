cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.09.17.08.11.stable_02"
  sha256 arm:   "f465e1a22f6114752a7bc7d18bc2a14eea326f30b616113d664f31ba2c2a1314",
         intel: "93e9b8d2619ccea9b4aff73d5177123adaa686fac8823f30e3aa19e81415f9d3"

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
