cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.21.08.14.stable_01"
  sha256 arm:   "b7192158f23fbcd063a839911d60de4dc919a5474d067f6fa041b16740b1d009",
         intel: "a11fa4088454a64fe659b3d24f37911f4cf0c5049a7ac54b3e6b91e76871dd5e"

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
