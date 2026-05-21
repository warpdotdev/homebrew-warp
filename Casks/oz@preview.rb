cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.20.09.21.preview_03"
  sha256 arm:   "9aab758860821a29b99c5ce11b54a8d805940f5d505cd0b060843ad80465ff73",
         intel: "f52cc9c81d502c888d25dde19af78e00f2fd1876f44aa8a064d289d103534da1"

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

  depends_on macos: :sonoma

  binary "oz-preview"
end
