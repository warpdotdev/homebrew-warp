cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.12.10.08.12.preview_03"
  sha256 arm:   "ed5aebbb02227fc057e03f0cd0d8c405342838765161c11919e41cc3e830c188",
         intel: "a7dd1da6bfb21338dd45d226ae6c57c9b32abdc7af5e5462ee7a6a32639f40f4"

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
