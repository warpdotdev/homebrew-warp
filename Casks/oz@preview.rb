cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.20.09.21.preview_04"
  sha256 arm:   "94ef8f1205aa01dc1f07ef083db9f3d9cd2be83a701fbbff9cb20022146a63d7",
         intel: "25b76b55cd67f9d105a96884e083df0ea8540698b42f9a8f67fcea7734192e70"

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
