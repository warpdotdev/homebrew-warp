cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.25.08.24.stable_01"
  sha256 arm:   "a38207608b9493e7405c03b1d0085d2646f7a265aa08b4a5e550e2d1bb79afc0",
         intel: "7aacfcecdd3db04254234b41bb55b2c2aa447670f584d0042cb89aba572a15a7"

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
