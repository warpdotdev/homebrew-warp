cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.22.08.19.preview_03"
  sha256 arm:   "fb344f497d321ef01e2d72a35323fcca13c72c20715dba6adfc471ea40d8d190",
         intel: "8443b1e87fc4c28ad2ed7aba21bc3bca9a3dc2370c48f6dc66f34a34912b2c9c"

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
