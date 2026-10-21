cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.14.08.27.stable_03"
  sha256 arm:   "d0f3e82bf413a40843c866ac484e373531ef78124256174e886df15d7c17e9b1",
         intel: "a09cc36b9808a92dc38eecc85106feb0f3962dd912511c515bfe3c8c0fce5fed"

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
