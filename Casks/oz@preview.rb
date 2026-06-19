cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.17.09.48.preview_01"
  sha256 arm:   "cbf2ad1767a50f27abbb99a10106d648160f7f9c5e87db0a3aa38c9ab14fc2f6",
         intel: "6c40aea440081710f2a0b2f604fafc0763ce3c14c3ebc824aae79d37c65cf01c"

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
