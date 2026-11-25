cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.11.18.08.17.stable_06"
  sha256 arm:   "000f5b5798b5b7b22b052f814e3193bb4f00c0f5d2bcb61f51e3998f01b418f0",
         intel: "605a53dd8c0e63713d4cbc2480319b46f427af0e3bb74bcf4835addc38439f7f"

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
