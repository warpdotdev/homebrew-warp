cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.01.09.21.stable_01"
  sha256 arm:   "0edd790da0fe9ea42b71cc5edeb2fb505d1c9e4f40162f3b6dc1e8beda85cfee",
         intel: "420ab06263c2bcc684d3efa537c1b979f2d7ea64c61b50e60f8a250553b54c07"

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
