cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.22.09.01.stable_01"
  sha256 arm:   "ba47a1dc2acfad557abd3273a459305d5ebaf20fcc1431073aef64575eb776c7",
         intel: "aade4408906fc44a666f9086309cd551e69aeee6b8220c0e00b94c0ad9b474fc"

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
