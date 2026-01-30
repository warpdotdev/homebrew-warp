cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.28.08.14.preview_01"
  sha256 arm:   "ca466c60fa4da54d8ca120abd9daf2a6dd66f72a2d4ce1e8d33467f18e38366b",
         intel: "894afa4328c7ef3bf835c999fb9281f4e72608dae3a945357084a27335fefa6b"

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
