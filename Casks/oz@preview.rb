cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.08.17.18.19.preview_00"
  sha256 arm:   "3a87e9801999538eee224ebe2b2c36fa4926a9090f74059ed3e81a6c373aef0a",
         intel: "c42f55431fd3f10d8e8210d9f03a5037ac44e66a928a66b1c243e96d3e713a27"

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
