cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.03.09.49.stable_03"
  sha256 arm:   "9b75878cbafc6a54aeea7dfa6319986fe12768e5c6d104975b06ca355fd7fd81",
         intel: "e9d6a9968872a5e30473bdeef5510725d8fe925784a246dc28d7d6e5e6da20b3"

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
