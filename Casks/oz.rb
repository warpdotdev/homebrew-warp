cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.03.04.08.20.stable_03"
  sha256 arm:   "f731de58dd1762bec1945184455bd74f02eab0890ffcdd6700a068029224aa30",
         intel: "d151bb8bc9b47a7be64dea2a7bd74bde43c9360915db7f08868546e1c32c23fc"

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
