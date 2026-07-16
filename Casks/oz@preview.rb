cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.15.08.55.preview_01"
  sha256 arm:   "45c8e77e17c166909fed5989633727c59e5b26f0b55e2b2d5860866987ab57b3",
         intel: "1aecc435380b40c81786f6e15d55020c9ce44724e4881f73a54796387e667d5d"

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
