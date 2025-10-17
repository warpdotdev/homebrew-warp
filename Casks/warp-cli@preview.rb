cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.15.08.12.preview_01"
  sha256 arm:   "14ef9ad67a8d35ea9890c65a65703ae4c394b00fdb8e92a8c64938dd1e200a54",
         intel: "957bc8fe049dbab472224def3fe62ad4c5119a932018e2eacc2042caa81f3357"

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
