cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.10.11.37.stable_00"
  sha256 arm:   "76e0db78546be7bb30e80a30930371625ecdf2f410d6ed76fe7f544f3d423f87",
         intel: "38dd11a6cc8be9943781c900f4c7f96dec418de17a1634c6da572d694cddc794"

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
