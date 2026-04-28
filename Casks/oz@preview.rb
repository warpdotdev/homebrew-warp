cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.27.15.33.preview_02"
  sha256 arm:   "1db43c81c89d7c95584794f32d39b34d84a4571c3a56e52f13aa2293a2adda42",
         intel: "ee3314dc384a7ec84ec491656fd48fd5af07ce3153f569e4ae35344d0b9ae650"

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
