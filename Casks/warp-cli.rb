cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.12.08.12.stable_02"
  sha256 arm:   "2b0468e70b12fbdbcf1659e0f26767e3cb4dff88834773eb2ea4771d12fc751e",
         intel: "d93d19d3ae6a6b6879693b59bf5b89e63932b72549bb5441c86f949497aa012b"

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
