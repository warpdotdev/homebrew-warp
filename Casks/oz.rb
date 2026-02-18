cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.11.08.23.stable_02"
  sha256 arm:   "ab64f4964dbae208a856dcb8580bbb587710c78c3f21c70fe6cb8458517b3d3d",
         intel: "237b77465ecaddb93bfa1b6f85c5999122fdf369e81757cab102ce23cecf5270"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("stable", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "oz-stable", target: "oz"
end
