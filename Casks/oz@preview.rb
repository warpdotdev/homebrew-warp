cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.17.09.48.preview_04"
  sha256 arm:   "3950b82ff7d2137df6752eb50a67b5e8e4df5a6eb4018ac029899f7c4cbd552b",
         intel: "2598125857eba446896ea216b3b03ca069595c89dd8977a4bcc33441a645b865"

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

  depends_on macos: :sonoma

  binary "oz-preview"
end
