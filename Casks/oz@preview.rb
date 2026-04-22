cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.21.20.43.preview_02"
  sha256 arm:   "8df5d2527f19013fddac009b661276e1a0e00ea23e1efaaa439b96e2df908bcc",
         intel: "39d7475e42cb66badc276b7f45e37cca33bbc2af40a74471ed75b0ff2e6f3018"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz (Preview)"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("preview", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "oz-preview"
end
