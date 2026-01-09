cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.07.08.13.preview_01"
  sha256 arm:   "2498d60f89b87bd1ce69315ddbef385ba3929f4cc253a65a5b1bf72f483d3b0e",
         intel: "db6f736775f31dfa6b22d64f51237e40148ae2a39eef360541cacc09f37c4641"

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
