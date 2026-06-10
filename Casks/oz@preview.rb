cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.03.09.49.preview_03"
  sha256 arm:   "3ebcfeb0c2f32c8620cb9bb0c5cbc536ad762253951d1ab0d160119b4a697645",
         intel: "2a2b49f2b3408896390a49a75cf3a9e13c1feccdc7bef49205af71dd62f7d745"

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
