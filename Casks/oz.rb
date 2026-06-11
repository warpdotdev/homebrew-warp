cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.03.09.49.stable_04"
  sha256 arm:   "a815df2b363df651f93ac7fffc1e7fa7491c96384041a081b1d92684b568d811",
         intel: "684d3279a052dc523bbba07e55bc2d3d217e30247d86c44682964ba428d2c0f1"

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

  depends_on macos: :sonoma

  binary "oz-stable", target: "oz"
end
