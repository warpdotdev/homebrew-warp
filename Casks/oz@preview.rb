cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.21.08.26.preview_02"
  sha256 arm:   "29c92eda2c2b8d204537e2e376a80b13f071f2c1e7ebbfdae63613334de6cbfc",
         intel: "30ebde23d1cd9e3836802725dfcfe97096969a6822a66a1c9ce936df412e7494"

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
