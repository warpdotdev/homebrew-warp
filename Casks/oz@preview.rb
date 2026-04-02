cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.03.25.08.24.preview_05"
  sha256 arm:   "1dc45fcf0ebf45c1fa9ddcb81c89f346cfb8e75e0d11128dd565306060a3c679",
         intel: "7e98cadc52a0b361a42271c90faafdfc3d4fa6d454d5b0aeaeaf9c4b8b6f7205"

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
