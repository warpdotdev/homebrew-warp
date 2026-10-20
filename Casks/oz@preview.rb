cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.14.08.27.preview_02"
  sha256 arm:   "eacfcbccdc3d9e48cb19a1963570864d85dbf2c410e9c2952af20f2ff5e61528",
         intel: "dbad6a465feee74006aee4d9972c59f77704c03886297f326221655b9e9cee5a"

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
