cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.11.18.08.17.stable_04"
  sha256 arm:   "d563eae05d8a163493b0e60fdc4dbca640d5bc08238bc45ac9559a87e7f58acd",
         intel: "73a3e2f8986cfecb9ff8909a0c30a7a579bb12697382d1851f64ee61e278a706"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      (json.dig("stable", "cli_version") || json.dig("stable", "version"))&.delete_prefix("v")
    end
  end

  depends_on macos: :sonoma

  binary "oz-stable", target: "oz"
end
