cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.24.09.19.stable_04"
  sha256 arm:   "0ceafb28aead4f6d81e4973a42241bbfe42091dbb0dcccb7e2aa841c53fd7659",
         intel: "d7df36e3bef5ab1a54a6a9a90307e5b3737f70bd4b1fce4769dc263cb30ec573"

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
