cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.15.08.45.stable_00"
  sha256 arm:   "5fdcd064135821a3a956b41dce23e6e5cf327e31f33bb2ca312ecf1fa8d511a4",
         intel: "b2a9f7fd5e6a25aa8ab08905a62910867038d36fdbe4e9eb531419ae0b90e9ef"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("stable", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "oz-stable", target: "oz"
end
