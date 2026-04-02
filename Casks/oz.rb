cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.03.25.08.24.stable_05"
  sha256 arm:   "2887512f79de9e6716ce2e54679081846143333d5ff9610e53158144b98d2597",
         intel: "c29128dbbfd9ee476f139baa114b9d6756e3e25dbdf399530e3ae4541fc082a6"

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
