cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.04.08.20.stable_03"
  sha256 arm:   "b9ca93d041bcbef7c1c6e782912f6fee796bd89d784a0aede73d915ad5b656f1",
         intel: "edb08c9e6a850601edb664b58b25e3e6704a60a61bdd4364fbd899d0053a2298"

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
