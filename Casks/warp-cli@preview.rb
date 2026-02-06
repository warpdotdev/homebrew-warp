cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.04.08.20.preview_02"
  sha256 arm:   "bf714c46a804700bc010bfbbccb31384f876449059d4251d6cf00c942e9765f2",
         intel: "98a946e5091ecb7c99850f44798b8e6151d48c994ca4dc13c9642432a36aa062"

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
