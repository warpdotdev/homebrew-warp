cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.03.04.08.22.preview_02"
  sha256 arm:   "42e67450c727cd9275744393f3ef89a85023dac0b4e49b7a2c827221d568a6fb",
         intel: "ff7225f5911520a441c3e5f067b62fba9ca1d3cd6ad9641d27796a6cb7bc5c13"

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
