cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.10.11.37.stable_01"
  sha256 arm:   "9cca49cacf85a95416117156168350bb4e4bd3fc0c43735cd5dfd1753bbf76d1",
         intel: "e2de12ff7bd058772feb94e9fc791340c84dfcbdbc8cba027e6afbf4bb243870"

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
