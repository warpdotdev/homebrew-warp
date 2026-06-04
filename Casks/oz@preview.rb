cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.27.15.44.preview_01"
  sha256 arm:   "8ac9bf8ab506324513e4fefee9eae714541f26a04bb509b8692d76afc6dff3a2",
         intel: "a7e6152eb8d28d2e890a2ab312f13b72bacf06ba6675b3e71b622859fd227605"

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
