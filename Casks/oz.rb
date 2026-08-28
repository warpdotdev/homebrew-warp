cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.08.26.17.59.stable_01"
  sha256 arm:   "0db2cf7f979bbcce57b4027e81cfd5a1553df56a7304aec7765cd279de07fef5",
         intel: "3723be211f963eb8d2577a652b9acd4da65dc3932ad6d146d8e8502ca83bcc73"

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
