cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.19.08.12.preview_01"
  sha256 arm:   "fd48e752bad1e861037c1bb17cd2a26cac3d58a4d0afc909aafab5c6d79f5774",
         intel: "763d0cbed589a17ded6603e26137f86ce3d5318335a1c95bccf2d9cc0c5659bc"

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
