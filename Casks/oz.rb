cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.11.18.08.17.stable_01"
  sha256 arm:   "751f681947b691997e6491e0a24358fa1ac1dde985ab701bf40174704c704eb9",
         intel: "40420208b3354838f522c53b20a07ff876fa2b00e9633c789b140b2c7ec71669"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      (json.dig("stable", "cli_version") || json.dig("stable", "version"))&.delete_prefix("v")
    end
  end

  depends_on macos: :sonoma

  binary "oz-stable", target: "oz"
end
