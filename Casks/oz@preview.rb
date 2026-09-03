cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.02.08.27.preview_01"
  sha256 arm:   "ad7946d2d8e8233d2fbfa9b6b8fd9a3bd724a50ab9639450fc4d069014c73390",
         intel: "036ea653d3e96cb4f68575e72110baa335d65e5219bb2ea059acb901a00e35bd"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz (Preview)"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      (json.dig("preview", "cli_version") || json.dig("preview", "version"))&.delete_prefix("v")
    end
  end

  depends_on macos: :sonoma

  binary "oz-preview"
end
