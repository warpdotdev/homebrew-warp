cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.29.09.05.preview_02"
  sha256 arm:   "32eeed5af7e834ec57a6475de804e05f82d45f5c2818e4b1554d8e68ac72a165",
         intel: "1df02a437896ae10cc48714dacd5ba94e2d69104e7f3403495fffc9a714c0b08"

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
