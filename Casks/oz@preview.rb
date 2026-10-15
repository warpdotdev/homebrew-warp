cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.14.08.27.preview_01"
  sha256 arm:   "bfa9772ed17b91347a56094e945bb928903c36ab758d2a3e68b8e8d5133619f0",
         intel: "bb0883769867824bc77eda65619abfcac3afaa27ec7691c2e4d3e42ffaa9fd5c"

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
