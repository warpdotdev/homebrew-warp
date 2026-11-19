cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.11.11.08.17.preview_01"
  sha256 arm:   "9cb4e41f4f24ff02eea855db69626ec54da59954265ff6d6c4f0ad516e736677",
         intel: "7bcf4101bca4829e1fd7f0b0f9ec3d4209507a3a4bed6ceaf6967e5109f17400"

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
