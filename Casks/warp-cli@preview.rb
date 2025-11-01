cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.29.08.12.preview_03"
  sha256 arm:   "c62dd3eb2cd0120c5d4ca5c247175af857f020edc6fbd5f93926fe778a267163",
         intel: "ad176d0de6726ed2922234e0e7ddb85a25d8646fcdf4739ddede4c94ffaba356"

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
