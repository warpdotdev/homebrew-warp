cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.11.18.08.17.stable_05"
  sha256 arm:   "41b2cbec5c310fe8e62ab73a5f9bffbe244f1972a27b2d2b9050255ab2f24042",
         intel: "9084f11c21a90bd928d89dfa1d2c672f08765e470d29c5551f57ef685c910eb8"

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
