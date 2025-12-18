cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.12.17.17.17.stable_02"
  sha256 arm:   "9ecfba85e1238c17c8306298d79a40d381a8b507b42442bef7c2ba752542bd59",
         intel: "a54145945e55c9998e96a5dea52faba5204c78e5669ff1b0b92d173fc1c01e33"

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
