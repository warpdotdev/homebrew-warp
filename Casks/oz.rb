cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.29.09.05.stable_02"
  sha256 arm:   "2fa770c9a7ee9c1c242485b0e3e8b0371e135dded1394ce367e9cdd3fed3cb96",
         intel: "514ea54c0bcefbc2d90de05a792ab18ccf1327bb555729e007001676b3fc3647"

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
