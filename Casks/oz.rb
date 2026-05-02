cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.29.08.57.stable_01"
  sha256 arm:   "97f2eb255860b13252f7d2d3c34dd1da614c1355307c6bc91a66705902e57146",
         intel: "adb824ce380404f69ac01084a49a0092d10b9a06980332d1a15ad1737063e90b"

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
