cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.03.09.49.preview_04"
  sha256 arm:   "fe04c9960516f3b71904e9fc7fa34b8354aca5fc6ad13da3893ecc115af84ce5",
         intel: "ff79d01021c2312b40b63a9d5a8c57de27b17459aa78cb590621c7913b735097"

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
