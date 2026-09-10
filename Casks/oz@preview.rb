cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.09.08.26.preview_02"
  sha256 arm:   "3fec7b8abd0f4d6c72ee9abab3087fbeb36aec3e467d0cdd0a55132bebf73afe",
         intel: "f0c7e9d6aea2dbe238a77b036426cf6df78c662d925f2cc04d81d5ab29193e6b"

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
