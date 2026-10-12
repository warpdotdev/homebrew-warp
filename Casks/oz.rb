cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.07.08.29.stable_02"
  sha256 arm:   "78622c021dbc99d53dc0c1bf06cf9ee0e5924f994c8361abaebf3642fc679c46",
         intel: "8665ec0c5c3facff3f6c5702ac2cb12435fd0c2bc70d6f35a78b871040f91577"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      (json.dig("stable", "cli_version") || json.dig("stable", "version"))&.delete_prefix("v")
    end
  end

  depends_on macos: :sonoma

  binary "oz-stable", target: "oz"
end
