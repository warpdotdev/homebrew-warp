cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.11.11.08.17.stable_03"
  sha256 arm:   "97b039e7d5dbd93ec92ec36735d22708d35f9b6b4d4a3c29a2d33a9f3dd2cde7",
         intel: "f85fb49f6fc0150f11be5ef7290a1ce9cd7c48ab1c80b506e686f214feaeadd0"

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
