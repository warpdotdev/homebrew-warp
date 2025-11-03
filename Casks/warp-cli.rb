cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.29.08.12.stable_04"
  sha256 arm:   "8ddc0e8793ca35d5f3b1d39d319e2c488ab59ce09a0dfbaa03beaffb40ba6f0a",
         intel: "6100d57bf133329e658d9a42da877e103fc090bed478bf96a1beca6f8486baaa"

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
