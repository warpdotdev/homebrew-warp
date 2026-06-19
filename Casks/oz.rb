cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.17.09.49.stable_01"
  sha256 arm:   "32d9682db6b70d2f0e3edb5e0ff393ff8c6e02eac218ddb4c62afc4ee6281728",
         intel: "3ba9eb2534868c98495827d37026b5dea386ab537a662817f19c6eae115ecf90"

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

  depends_on macos: :sonoma

  binary "oz-stable", target: "oz"
end
