cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.21.08.25.stable_02"
  sha256 arm:   "c3e1065c57ee55903a0a02e03fec3dee07478cfc5d365db82d836b67eb6d5e48",
         intel: "109b4aba46c2cab850527e9a5290bb44d326a0d1bd7e93c750a72fdb8ece803a"

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
