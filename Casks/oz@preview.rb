cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.16.08.27.preview_01"
  sha256 arm:   "39e184c1f1d553589682c90b4e74c406328f556f04c45f09282f0037011f6288",
         intel: "7bca74d4bb3379fa99b33dec7c71370d790a930d85324042c5fc60d7ad56542b"

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
