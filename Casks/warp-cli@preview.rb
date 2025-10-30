cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.29.08.12.preview_01"
  sha256 arm:   "5bb9a22459df4febbbbdef386a1a81680a1c59dd74497b3d580ae5eb16c24a1c",
         intel: "76adcd9f4ed170ee375face6135ddfd771621355091f6464896d238ba2dd07c4"

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
