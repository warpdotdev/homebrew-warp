cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.30.08.29.stable_01"
  sha256 arm:   "19e2a72e8a19024ddd0a1d09b6a23068abcfb840828f56996a585913f4ac6a22",
         intel: "6a76ad3b7a255497e4a5cddb675cec5a4d0221bcfedbea54c090197e3bcd8ff5"

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
