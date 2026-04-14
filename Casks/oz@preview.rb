cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.08.08.36.preview_05"
  sha256 arm:   "dca0a820d670b7b9e7348b934359e0be15b951b14176d1b2637adae34b8b1031",
         intel: "e5363b39b55c9e925341ae857092b3414a53cfee8fa1dfafcb40c3715ec6d73d"

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
