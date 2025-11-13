cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.12.08.12.preview_02"
  sha256 arm:   "780707d3f0b101a2710d1e916428a98d8c7f4b9ceb5b5b1744136949914aa3b0",
         intel: "3ebc04f6b5c1c2d1bb1dcbc3f23a5126b1c35dbba1cd272f9404c29d5dc6b24c"

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
