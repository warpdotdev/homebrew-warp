cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.24.09.19.preview_05"
  sha256 arm:   "ff168e7d8344ac495d957e50a3c6687cbf8d309eb913153124ad885908d3dc92",
         intel: "b51cd1b23309809d705816b40d02897cf852cc55a13f8cca11bca575b9f8a10c"

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
