cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.09.06.06.preview_02"
  sha256 arm:   "4ca034fda6b0869f90c8524b98c399a05d502d6e3db829ed94553b7a7e8c490a",
         intel: "93e3d81fb26c92251b794611981c6c91967db0cc806adb2f7fe79ed0dc6a40cf"

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
