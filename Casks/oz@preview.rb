cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.03.09.49.preview_02"
  sha256 arm:   "d03833716cc613f4eac3c2363ef40cf8a3e6678e4d774ea32db6325656af9ff0",
         intel: "08b5b3653e3ba701604df2c9914f85ca14d7eecbcfcaf4b2dbf9ff21185f740d"

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
