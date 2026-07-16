cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.15.08.55.stable_01"
  sha256 arm:   "5078f00dfb97a7ac6ace3429e01ff1dacdfdea7459c475a33e5aa3073a29d021",
         intel: "31e6099342c6c6b3807ea0c0006ced89774f8eccc4c9f81fb892ea9b43bd2688"

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
