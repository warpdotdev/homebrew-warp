cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.09.17.08.11.preview_01"
  sha256 arm:   "b61f889b73923424b5e6aebdabd3c0343e75a8f2776a78384a8531b0c59fa3db",
         intel: "c9ea094d16e60cff20f338d79f24903c74e3aaff2289b0e37c0c0179becea55a"

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

  binary "warp-preview"
end
