cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.19.08.12.stable_06"
  sha256 arm:   "aa3f250c64c8419d507366d42a30c369509fb240f958150a0d582ec89f99df43",
         intel: "eeaf383759368a037cc6ddb9a23fae84ff5ef56ff289737b39060ec9846e7565"

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
