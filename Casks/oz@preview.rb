cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.10.11.37.preview_01"
  sha256 arm:   "4825aa88111670481401fe26f69dbc4049704accc3457798da8f34020fe585f3",
         intel: "f1ee7c5a73f26b37fc4c52f2c3ac976b2177d559df257b1c255eafaf992b7d16"

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
