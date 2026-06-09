cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.03.09.49.stable_02"
  sha256 arm:   "4250fbb6535d156d33758d02371ef156133b945399f2e471a9e15419192e59f7",
         intel: "320307efe7222336cefc2a9bfab6256245fd1da30cb8ee969f708611841588f8"

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
