cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.19.08.12.stable_03"
  sha256 arm:   "7806e10b954b8550cd9ba67a623ac75a0f30a28002dd193f659314e4310a57e8",
         intel: "c3d5e7ef9e15630b51eba379b5c5a1a1be72e3d97af284593b1079f236623b37"

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
