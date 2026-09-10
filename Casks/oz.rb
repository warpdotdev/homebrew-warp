cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.09.08.26.stable_02"
  sha256 arm:   "a4a0f80f5515cab99f87de79c8b35c839e5fc11ec583fc4076c0a89c39759a62",
         intel: "f79077033615a604f6c6616e34b1e32244b7a8c16c3c616cf8e8db959e007a6d"

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
