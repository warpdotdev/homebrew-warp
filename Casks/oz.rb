cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.02.08.27.stable_01"
  sha256 arm:   "2ecfa849827f5174e03783c46f62c817100e9b8ac6317b25a5ceff827201d651",
         intel: "fa851fb1ce07dee75b7dd622e6063f3883206a026da49089567307d9c852ad2f"

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
