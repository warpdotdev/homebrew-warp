cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.08.05.09.03.preview_01"
  sha256 arm:   "2d4d82eefb21e1c1c8044ad1b3444f2f360b2c3bf66d2135a8c1a023885bb482",
         intel: "25c6443f9f0d7a9c18e65534991b8b27bc90e2e3b39b6cb06960ef353d2f3cf1"

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
