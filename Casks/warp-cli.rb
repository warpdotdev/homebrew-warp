cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.14.08.15.stable_04"
  sha256 arm:   "b6663f4e6e0408922e25986bd437773b7f1a1c85e842310746abd54ab3fc8f91",
         intel: "4ffabcecf659676815458d51cb227f92a555af3262da0c313839f931466cfb5e"

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
