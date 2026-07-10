cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.08.17.54.preview_02"
  sha256 arm:   "8b9e466ad571a2005491820a3bb928b34b3c443317ce1d7400a6ef74799dbdca",
         intel: "977c31f78a721e6f69f5f926e5621552074af0cfa28f16a44f38239f21cabff8"

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
