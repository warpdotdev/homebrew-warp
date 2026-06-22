cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.17.09.49.stable_03"
  sha256 arm:   "6310dfd8735d72a0ee8d50aaed30c4d21f3a44b02239aae4b006086f07550003",
         intel: "cf18bb8c215e28b31563be23b5fb272b94616e6ee5aa4df6a6cd4f38d2998bfe"

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
