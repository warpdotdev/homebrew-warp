cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.12.03.08.12.stable_02"
  sha256 arm:   "5f856b8e388eab4f50502811afa85ab7ed06ad1e9f6475aacd3fe6c3e43a8a45",
         intel: "2e917697a07827200196b4a61fc775271a02d863890894ef9f619ded05d6406b"

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
