cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.24.09.19.stable_03"
  sha256 arm:   "1267934e862d4223d8c3c5686d065be858dac5bd383ec0ff27a3b2a84111b31e",
         intel: "33f55a4fc2919eae6653218db7af288651cb67cfd2f5872d88013f518fda20e6"

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
