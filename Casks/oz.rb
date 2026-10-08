cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.07.08.29.stable_01"
  sha256 arm:   "4461adb9eeada7518178340961e86939cce8e51eb6617f36a1c857c7f364ef77",
         intel: "5b5cd6b687d3043b42cdc683c216d8daa408909a5c5b2cc87d87800c3c690477"

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
