cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.04.08.20.preview_03"
  sha256 arm:   "4092632193bdee326b0ff9f6ded5bfef7efdac276f9d23a32845c3fea4e36736",
         intel: "c85b5dea345974a6585b9c09b5fdd384d5010eb55fae6542a5cb0940b39c7c5e"

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
