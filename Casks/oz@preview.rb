cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.03.18.08.24.preview_04"
  sha256 arm:   "8b0b9827fff0d9cd95363f213417d62ef90b898264f81dcf9c2b90405383d55c",
         intel: "e33464c57c649ed26bbd68057eaa36e68361fd923af1068bba30cbe61b67fef0"

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
