cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.07.08.17.54.stable_02"
  sha256 arm:   "041c3630cd31b4d3142b9ddf3e794d7c0bc4f61e59252fcf1deee18200234a94",
         intel: "c47a66f4d81185e93870b4e1c334e4fbb7854119125fac0b72c0272a915b9eac"

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
