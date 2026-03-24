cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.03.18.08.24.stable_03"
  sha256 arm:   "7e371d96205589a241d10db20d844c40cfd7351a3726aaade0a5f7510ca854fd",
         intel: "08660c1dae5ef8b2414cc57ab8ca4315e543f2cc7d34d5ad5506182a1b986a33"

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
