cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.18.12.25.preview_01"
  sha256 arm:   "e6d5fed6f84e6958528460152582676c8edd952d5c1076c332533c828ec3fe2b",
         intel: "b87c4332b0f8da0c7856c58faac73fecbd10951d777f4c92f6d66f6d7daf3766"

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
