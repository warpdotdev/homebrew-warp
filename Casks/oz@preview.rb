cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.29.08.57.preview_01"
  sha256 arm:   "12f17902938a7b142d5ad17003a331b42d1548cdf7d43264dcc5a084177ac6b5",
         intel: "d19dcb10f88d5c57dfd7685dbe13fdb31c47da966c6bc1dd5b832ca83d7ef707"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz (Preview)"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("preview", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "oz-preview"
end
