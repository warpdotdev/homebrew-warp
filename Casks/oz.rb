cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.13.09.15.stable_01"
  sha256 arm:   "6632e25704f8bf4f7a87d69beb4d2cd7e63a18dc878958443e08c4363b48286a",
         intel: "1d3837fde209ca46e7c068d5ac15c92ba035f7fc6538fb2f44b1e1ef01a2739c"

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
