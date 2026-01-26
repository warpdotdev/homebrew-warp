cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.21.08.14.stable_04"
  sha256 arm:   "73296a773c84cb0ba326dd1431a0f315987e8ed88ce3b15279f555c02fff6093",
         intel: "bcbad57cb844779e3d7570fdc7e2cfcfd4a99f8758d0bb05d16bdeddb0b1e4ab"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Warp CLI"
  desc "Command-line interface to Warp agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("stable", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "warp-stable", target: "warp"
end
