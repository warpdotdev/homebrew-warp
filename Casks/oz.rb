cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.03.18.08.24.stable_01"
  sha256 arm:   "bfcf764b67c176effe654f419e78795bd0d84747f16b891d23e0560a7f686604",
         intel: "c268d21bb605b382e14f2548c1ae1531006d6c7feaa08220bd889bc8bcf45a3a"

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
