cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.08.17.18.19.stable_00"
  sha256 arm:   "2300b069a719bdb6e6cf66562dbb9bff58eb946354c14ed744c0fbcd88d41dac",
         intel: "63ad80aa4e80e1e557058f6fdcee5cf30727459118169d9cfdd3c6c884d523c2"

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
