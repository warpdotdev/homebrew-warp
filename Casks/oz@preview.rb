cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.11.08.23.preview_02"
  sha256 arm:   "7ff23da7643dea1b9a4d50d1e8e8e7db0df1f504b63bc82f439db417b44c4b8b",
         intel: "b34a0bb662acd32e3a660941cf4e600f79e85b5efa7ecd45cbbf6490d66317e4"

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
