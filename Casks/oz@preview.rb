cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.18.08.22.preview_02"
  sha256 arm:   "92e54de20c55b485519e9bc7bb7a8254d2ebe617e21082aa8ee679586c84bb33",
         intel: "b7b955a97119d933bb8ada0c96365de9800b0058bcd414c6c332903656a3bf1a"

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
