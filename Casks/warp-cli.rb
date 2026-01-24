cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.21.08.14.stable_03"
  sha256 arm:   "2426740c8a6efadb037dc80153e5e721e967fb2a1266bacc6235713c5d00c22c",
         intel: "c1614007e099dbb8ec8a00c6fed47240ac728561112438323b5efde32fb91851"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Warp CLI"
  desc "Command-line interface to Warp agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("stable", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "warp-stable", target: "warp"
end
