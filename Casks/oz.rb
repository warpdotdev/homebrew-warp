cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.08.12.21.54.stable_00"
  sha256 arm:   "4cb648f0b84782cf8cff0e7d99bc6ddae2e224657708d332235fa499762c2a4d",
         intel: "f2bc3c9d25d57907bd1e3e028466d4bbbff05f8d6e45a55e77466e01e8d29624"

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
