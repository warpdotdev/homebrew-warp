cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.14.19.38.preview_01"
  sha256 arm:   "0049642f430d95e706838e1222a0fc7a8f920a74019203bc521c41d01ca5e1b4",
         intel: "be267421c3e2fd0520aeb4333667598a51afd3cc8cb91a23514d90b185575116"

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
