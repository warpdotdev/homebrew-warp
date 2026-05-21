cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.20.09.21.stable_02"
  sha256 arm:   "ec90b294df391716a999f5b02fac8cd6dded86a2777d7024d78e687d5dacb48e",
         intel: "c68e8abeb97d1b83eb13e14ca7943f1336c72e95ce79128d9fe0618ac3199706"

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
