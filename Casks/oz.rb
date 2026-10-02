cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.30.08.29.stable_03"
  sha256 arm:   "60257fb7464aa55cc8e387f600a0d32bb741a7425a3be4701f22868ae7dbba13",
         intel: "a6894557b9c91548219cf73f7b2275fe9e54e334635484fb73396e7737d0bdb7"

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
