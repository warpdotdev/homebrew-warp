cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.22.08.46.stable_02"
  sha256 arm:   "d727acf7cf176b799e491b8f7e7e210238a245be16dbb8fff7bb0460bad5f68d",
         intel: "64cf9c2e61b33fc020b4885f41966701ae6b0c11f6f1c704cff6926c2ea9578d"

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
