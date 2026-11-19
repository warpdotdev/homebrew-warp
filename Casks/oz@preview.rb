cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.11.18.08.17.preview_01"
  sha256 arm:   "071156ec19df83f2ae69458d0578999af5717083868337c32cac7b5ba7c7eabe",
         intel: "a6358b1aeb2f787e829d49803a74eff87f78e44aaa6d3eb9054ecb4219b9abd9"

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
