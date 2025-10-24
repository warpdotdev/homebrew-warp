cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.22.08.13.preview_03"
  sha256 arm:   "b0d56a9d55aefdf389a47e5ab1c21e2f81d086e06d93cee1d09ce814c8d8832d",
         intel: "d33fae3d1ee127aca543a2fceac4d2092911107c35e80203b6bcb13a77a6fbd8"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Warp CLI (Preview)"
  desc "Command-line interface to Warp agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("preview", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "warp-preview"
end
