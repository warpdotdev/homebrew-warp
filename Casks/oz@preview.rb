cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.08.17.54.preview_01"
  sha256 arm:   "3539300f9c8e1607d060116ad0de09f7b8db73951499f1e872956039e41d7ace",
         intel: "df12d266f38c14ca32ea39dc7c1a4ff28623dd6a35aaf996604c272aad49e72b"

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
