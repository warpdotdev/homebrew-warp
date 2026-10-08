cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.07.08.29.preview_00"
  sha256 arm:   "83e6c777e6d2f193f12a30a8038a9566bbcc53b62190efeb503c0b2ed2b864a3",
         intel: "0c17d375aa5b2f1b72e2909b5a7f93846d72e52cef648f90c37cecd5e4c9fc0a"

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
