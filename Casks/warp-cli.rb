cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.12.10.08.12.stable_03"
  sha256 arm:   "f903feedc5eb1e5e96acc594db9e08a1a082cf0b52ede111d95e85e956fd0f0a",
         intel: "45a6cb0c88efffe5d5a4a58236d2a98da02512d728f5be2a0b89dbe2cd50ebb3"

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
