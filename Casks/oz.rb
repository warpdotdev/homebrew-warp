cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.06.15.42.stable_03"
  sha256 arm:   "c941cf8189cf24a4dbdb12237eeb6a817e37bccfceec2e02b85d79552454ea26",
         intel: "1fd435b6d2847374faa5842aec2b7b9b57aaccfd17a7ca27b67dba786cb87230"

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
