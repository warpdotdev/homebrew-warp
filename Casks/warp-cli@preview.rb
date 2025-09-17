cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.09.17.08.11.preview_00"
  sha256 arm:   "5b46798e5575fb13e2e0a5f848e297a67c969ee87af84bf67b80d7dc03fd4c45",
         intel: "cac930991a7c0e3fdf933948ebbde7513ba0516a7fe1307e439c56e3576b19ac"

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
