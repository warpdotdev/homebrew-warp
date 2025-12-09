cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.12.03.08.12.preview_04"
  sha256 arm:   "7fc67ad6498fd06099bd129cfeb8b037a3778a1398346434160d26fee454039a",
         intel: "c84d2bdcf52e666a84391a5c0fdb2f6a2e565aae4e05b194ad4d434c9ed2ea7d"

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
