cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.18.12.24.stable_01"
  sha256 arm:   "019dc319acb19490c30b58f927861420e675dd621a847b714c9183b67b110d72",
         intel: "4bf8876a2e3fe9582590528d0d99e687baed1d8aa0b004dff6ed67e1da25acf2"

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
