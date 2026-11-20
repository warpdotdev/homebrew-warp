cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.11.18.08.17.stable_03"
  sha256 arm:   "22e60f713aee828e4b01c2c13801e595da35eac75f35469032793a4b37a4ae20",
         intel: "4513dee601b851c763baa908c6ff794ab08d7b4930fa87756eb269be37a72eaf"

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
