cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.06.15.42.preview_03"
  sha256 arm:   "eedcee00440162b1276d29e48c6058680496d3ba9f56a202e890a2792db85a0e",
         intel: "46496426512f40ffc3523e83c0e39a00197af8ab60c7f6792ac41efe5d29490a"

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
