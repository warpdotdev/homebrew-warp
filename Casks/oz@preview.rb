cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.17.09.48.preview_03"
  sha256 arm:   "fd47955cc9cdade6c20f589df2c75dcfabe384b48bbb3ad2f7302cff55ead0cc",
         intel: "a554d8e66e633261bc4d4e72eb69e51b5bc136812e8a2dad616221006418d227"

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
