cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.23.14.34.preview_01"
  sha256 arm:   "eb31c01b133fd801140de9d5d9c3eadf0ba7b5aaa2ad56adc537a6e50e9d58aa",
         intel: "6c5e779c823e00013a61e339db2a627adc9bc8a2a3434c7a30b2b009c2cc5189"

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
