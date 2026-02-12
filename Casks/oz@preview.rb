cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.11.08.23.preview_01"
  sha256 arm:   "c8f9049cb717d48195ee68f61326dc08fd9c82324bcaedf4cc926b55b1aab272",
         intel: "c807749a3bce0b0123644a48d54f0f923f956d0d422ff1d1129aca09d9d5de99"

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
