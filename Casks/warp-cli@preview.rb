cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.22.08.19.preview_04"
  sha256 arm:   "d61623be15e6c4e8a1ef8557d7b5e3542292415d3add03a82b0bbb910f0e23dd",
         intel: "b3ea33e54ee2be3a5fff5194a6adbcec0c8ca199e2b1d0cc150c4bf61dc1e893"

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
