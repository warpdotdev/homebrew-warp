cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.08.17.54.stable_01"
  sha256 arm:   "b0dc5f805f1a33a499071bb70581bb4bdad974753b5144601cb82ff1b094a50e",
         intel: "913af59890d641da41374826277559b94274ba31a3e9701067a1afaed47f4c35"

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
