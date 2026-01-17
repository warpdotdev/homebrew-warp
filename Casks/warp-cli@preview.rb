cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.14.08.15.preview_03"
  sha256 arm:   "4a8084725f1d1380dcb335110235d1fd90787268ecde1544bff7e71ad44fee5e",
         intel: "1c24da15ee8d4cc5305f2f82b3b2a04cb2711f7d4a74268eedb88e25c6dd4b8a"

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
