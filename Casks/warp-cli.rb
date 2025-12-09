cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.12.03.08.12.stable_05"
  sha256 arm:   "b33fb66fe5648a21f00bb337ec3912bef0c048d75ed1c824364555a81d3b525b",
         intel: "1fbd68c15bedbb9e69136a0b9b3e416dcfa08e21bcff017b0260e63cfc7bd7c2"

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
