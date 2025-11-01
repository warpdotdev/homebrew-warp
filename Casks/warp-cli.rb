cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.29.08.12.stable_03"
  sha256 arm:   "a74d71a585d69bccde2657e43bee17e44a43faf43f2ac51e3cb9df70df7694d5",
         intel: "cd51c800047fe18dfa3db43ecfcfe48c2c5460a0727d0ce1f83377b862c4309d"

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
