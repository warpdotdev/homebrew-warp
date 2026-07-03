cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.01.09.21.preview_01"
  sha256 arm:   "6c9c37131fc9a4f4ba94f95420ac771eb268f6a33cbf506d7e081f7ebade14e4",
         intel: "1a4c79577c37c0c49da0c16baade43eac41a9e4996acdc6e3457a8013001fb9e"

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
