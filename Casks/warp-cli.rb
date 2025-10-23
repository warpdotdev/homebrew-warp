cask "warp-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.22.08.13.stable_01"
  sha256 arm:   "19526865db2e5c65cbfd23df4d816e8036d68d9e62998033031ca63ceda52fb6",
         intel: "3057d128171fd1210fafd0dcadbb01f38221a79eefc765c9ab073714ac2cac4e"

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
