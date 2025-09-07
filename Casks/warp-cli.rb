cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.09.03.08.11.stable_02"
  sha256 arm: "02742d107b55aee442acf6fa6a0729733aa53ada0fa8c6b41102a1cb7857af0a", intel: "XXX"

  url "https://app.warp.dev/download/cli?os=macos&format=standalone&arch=#{arch}&version=v#{version}"
  name "Warp CLI"
  desc "Command-line interface to Warp agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("stable", "version")&.delete_prefix("v")
    end
  end

  container type: :naked

  binary "v#{version}", target: "warp"
end
