cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.14.08.27.stable_01"
  sha256 arm:   "c47b41cd4a7f4ce6577b4b9ea3fa0349c88d684de526941a4f5257c7d2b16f16",
         intel: "931ab7e82fcc431f1088096865dd67b6e8efa7a16da6e05e429ed9b35fe3cb43"

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
