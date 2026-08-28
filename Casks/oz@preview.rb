cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.08.26.17.59.preview_01"
  sha256 arm:   "c08b1b5e66e6045d829ae6f44bcd73602a8628c48fbed8ad00db08a913c510de",
         intel: "2e9b64d45ec6ce91fb61afccac2c876baf12e7b5a50b89b4c8ff9c0540017650"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz (Preview)"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      (json.dig("preview", "cli_version") || json.dig("preview", "version"))&.delete_prefix("v")
    end
  end

  depends_on macos: :sonoma

  binary "oz-preview"
end
