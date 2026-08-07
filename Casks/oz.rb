cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.08.05.09.03.stable_01"
  sha256 arm:   "447ac31513a436f21c86c38381b92e4aed6bd81d1dd52562e16eb49436212950",
         intel: "557b04a81908ec0332ef0ed6378b1356999397923159b4e7cf09299e7880fd04"

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
