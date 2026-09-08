cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.02.08.27.stable_02"
  sha256 arm:   "624334b9ce6c33885afbdad0576a993d2f2429546a96dfdf42e476dec3870550",
         intel: "55a520916a862a243c4bdbe704f19e5094e4ec9a0fa7f35bb901f0b78a62f764"

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
