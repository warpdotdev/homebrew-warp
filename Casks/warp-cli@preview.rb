cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.06.20.04.preview_00"
  sha256 arm:   "839d0939c81df666f34bf011f4c3fe6ea82043b7d74a5fc1ef55a0a31698b99e",
         intel: "85b7c9bcae4dbb785453ceac03a653b93b2842f6a690764aa3e703c4384a6dec"

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
