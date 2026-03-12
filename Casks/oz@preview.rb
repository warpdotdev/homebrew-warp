cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.03.04.08.22.preview_04"
  sha256 arm:   "75db6d6f16d503d898b46efd2c52e807ca90a9de9642c28830422d622505366b",
         intel: "0c52a76ba6797fc84770b1a571ab53dfe95e95982ab45fc2f2c58dca90093928"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz (Preview)"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("preview", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "oz-preview"
end
