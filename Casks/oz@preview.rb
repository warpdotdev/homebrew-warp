cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.08.12.21.54.preview_00"
  sha256 arm:   "98a125dd31a17127f3fcb95e463a7f7a4fa2f144c8c31e3c07d7fb207cc7b8ab",
         intel: "8ac01d3844e4425ddac4b05defc17bdda420c46ade02757621c0e1def86ae29b"

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
