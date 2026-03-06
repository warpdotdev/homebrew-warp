cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.03.04.08.20.stable_02"
  sha256 arm:   "1787140701e453f59c54401a43e002289460b4e33bc758f6460789d1546b131b",
         intel: "6556313f989b2cbe42a36ebf319d53766ea2e3bb82947045894cfff56704fe52"

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
