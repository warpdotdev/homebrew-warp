cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.10.09.27.stable_01"
  sha256 arm:   "299de8a86005b8ecd82922eb551f5bd5bb4ec15e3a78ed6ad5a42a9d1807987d",
         intel: "6d29497c163f679cbf024d2a669fdfc81424f4cf2808b4642dcf6acb366c26e0"

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
