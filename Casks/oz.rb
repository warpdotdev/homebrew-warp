cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.06.15.42.stable_04"
  sha256 arm:   "27d7357464fb1af17165a73437188194939a1733e41a77e545f625a4a15bfdbe",
         intel: "f2d5cad0f0e00dbe8b752ed16004a136478a04936d1bafa23e622a98c75b9c59"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("stable", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "oz-stable", target: "oz"
end
