cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.12.03.08.12.preview_02"
  sha256 arm:   "2a38d78737777b69c485c8a0ec4bdc1fade0b5985bb3e9bf1358911e0d7d2061",
         intel: "fd79e9b07d4d0a78d25557e2d766b5b7da5eee1f97e854889e7cc1c11181b279"

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
