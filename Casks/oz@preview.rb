cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.24.09.19.preview_03"
  sha256 arm:   "d7eab8abbf6898ac371b4cda6501bb0e553a61241adeef75cfa7e3cc4bb18cc8",
         intel: "3a9e66df95e1749f379c3f5f55efcee86a647e97fe4c183272843fb874508fec"

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
