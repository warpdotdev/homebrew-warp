cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.01.28.08.14.stable_04"
  sha256 arm:   "dccb0d8e0a434262629ccc1e0a30f226825083883c81fac29a5de9a8312e1f27",
         intel: "e7732e71e483d0e4f52afa86d90941c6cb11fed1f3452b9c3a01ec923afe92e5"

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
