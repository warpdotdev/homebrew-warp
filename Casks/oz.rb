cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.09.08.26.stable_03"
  sha256 arm:   "0e9824f4c414c0f555b0636a75c9c63e2dadd6b37196c2a3c0095427bc216e2b",
         intel: "62d859451f7fe0e0e937fdfe4387c498272c67fd3de6aad93183884ac7cfa91b"

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
