cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.20.09.21.stable_03"
  sha256 arm:   "64efd48203905cd4336a5d569d4c7dd877c73399a357ef4de284ed41ec350ea9",
         intel: "5d0e7ebfcc289790cf76f265c47415f8532358cfb583b36e5bc466e01a7c9023"

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

  depends_on macos: :sonoma

  binary "oz-stable", target: "oz"
end
