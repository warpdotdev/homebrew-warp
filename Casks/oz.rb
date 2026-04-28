cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.27.15.32.stable_02"
  sha256 arm:   "bf188c7c7f675ab1daa4ab972fc58fae95edc40efecf8d07ef7bb7b96c64c920",
         intel: "bf1dc10a2f05ea4f88ae6a16209e9626c008f12f9efd3e27a193c1843d84622b"

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
