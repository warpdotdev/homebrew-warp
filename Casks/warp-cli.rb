cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.05.08.12.stable_00"
  sha256 arm:   "98c8f1cdde574a857324d2fe686e18675e1f622a917cb58c04a11dd6c0b7f280",
         intel: "baf359ba3a0dfa89beb0688bad098aaa10c5f0c1c8cc3bf01a799caf095ad19c"

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
