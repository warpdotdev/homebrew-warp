cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.28.08.14.preview_05"
  sha256 arm:   "b7508f24f778b08b0471e096cabb6f170a219b4cff820406d3019ece6367e640",
         intel: "36a3ffb14254d0afd64d51ff2dc4138ac93d9fb5e78082d9bcd95815dd3fd1c6"

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
