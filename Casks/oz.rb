cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.17.09.49.stable_02"
  sha256 arm:   "aea5fbb99a4812db2216067a93844f0450101152f570e0984e1dd69240e101bb",
         intel: "14102930f0ba166b0780605b440e84066d335f96d27b98f83d5200954d733a24"

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

  depends_on macos: :sonoma

  binary "oz-stable", target: "oz"
end
