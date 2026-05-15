cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.14.19.38.preview_03"
  sha256 arm:   "a945374c40dcf201f9428bc723229e34f58e774ff6a9ffb9dcf0a2f1547bf4d3",
         intel: "332122ce353551a4cc4b40c372c1f166c275efbce204fd56daa64b4732d47e51"

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
