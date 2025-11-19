cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.18.12.24.stable_02"
  sha256 arm:   "14a36efd2ff6e94153fea0b5e7f68ce57699dee633f5f5895dceae6c19c55cef",
         intel: "56ff69cd4867a2482323d9e3530b84f99f3a6c3ebe54ade9a4c5a98f1fc6338d"

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
