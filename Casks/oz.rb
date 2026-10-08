cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.07.08.29.stable_00"
  sha256 arm:   "d3bffd75d17ed896b52af5f946bff260d2517fc83310afcb6a08b85fe6c69215",
         intel: "ddb52955e2f6980a2256fb893323d53af5b1f45a08f07261b5e34e0a6fc9ecf3"

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
