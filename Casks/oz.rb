cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.08.08.36.stable_05"
  sha256 arm:   "e48cc3482930f1e6908b955ae1c8dfdad3b1f3e2e2c526d7ffb1d19e95cc0276",
         intel: "6437d595a24086c9998b52b7d0b1aa734197cafd357a53b7e75847db6b074ac5"

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
