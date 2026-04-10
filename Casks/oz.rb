cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.08.08.36.stable_02"
  sha256 arm:   "d0b916b4f1f89282a5542371cac6cbf57df2ad084973a5bd902b2272af07e2c7",
         intel: "6bb99e258cab78d0fb81ca8fd17fa2d3c890ecae219a0a6c3a6a3377326097ce"

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
