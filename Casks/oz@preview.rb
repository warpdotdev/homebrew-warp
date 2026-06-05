cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.03.09.49.preview_01"
  sha256 arm:   "c881db933b003f3e864d34dba4d59f081e303616b980e52ecfa95af2e4c255bc",
         intel: "37fdda83146057d7ca0084b86ff7f1f64641d05d92389c2dadc19d89aa2c3318"

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
