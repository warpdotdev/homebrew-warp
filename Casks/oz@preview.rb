cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.22.09.01.preview_01"
  sha256 arm:   "c3b880372930b1dd6952a2d64654a5556195b55255d57e617d151b5c6415d1d2",
         intel: "194913515ea317ed818e35d361971f7e274b5533117ce97721f743f0834fe6f9"

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
