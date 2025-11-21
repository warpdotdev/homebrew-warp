cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.19.08.12.preview_02"
  sha256 arm:   "03f916112fddeedba735c38f95e4293d93098e08395d5e4ba28038bb9fc8c8bb",
         intel: "0e4217a681305947491b2db8d28a6003dd5d77536810e552fc65b684843eeb5c"

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
