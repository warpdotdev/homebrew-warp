cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.03.09.49.stable_01"
  sha256 arm:   "352a64187a61cb74397ab5c88421a702aeac677c68a540d661e765d05c86a3dc",
         intel: "287d9c687d124bfd81c7147d3ee7eece4102acd339a932e1adcfb6965aff6cd4"

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
