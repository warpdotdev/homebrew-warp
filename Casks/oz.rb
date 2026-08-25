cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.08.25.19.26.stable_00"
  sha256 arm:   "cb2c256a2e04b886406382fd88fc270b960e0b2fe8e79307a5ba656db31d49f8",
         intel: "a4d7c61f7a1a37e4400660b5a39c4290cae88d116b84edb6291535eb211d43cd"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      (json.dig("stable", "cli_version") || json.dig("stable", "version"))&.delete_prefix("v")
    end
  end

  depends_on macos: :sonoma

  binary "oz-stable", target: "oz"
end
