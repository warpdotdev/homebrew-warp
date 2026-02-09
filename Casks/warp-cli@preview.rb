cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.09.06.06.preview_00"
  sha256 arm:   "8cd3e9e3b62c231e1e126ee6a158446bf64714c2dabc6e4b765f05f94dbce146",
         intel: "589a2d49273b577cdc16f6495e02730c797fd7290f46c26b6899fef0ffbc24eb"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Warp CLI (Preview)"
  desc "Command-line interface to Warp agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("preview", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "warp-preview"
end
