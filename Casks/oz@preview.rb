cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.10.11.37.preview_00"
  sha256 arm:   "7cbd4108a905c17bb4d647d8ae1c87836bf1d04082a01f08f2829aff52e3ddaf",
         intel: "d3e45e591fb5f04f6616d4e1a7d2707e74733c9de31ad599bffee0c2b53c35a3"

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
