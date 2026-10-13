cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.07.08.29.stable_03"
  sha256 arm:   "e0df39f615b42242f576328640056dc59826a9cd92131ea298b57a9cc31792fd",
         intel: "079492df4c111a33a4f832946c33998ae05038bb42f354e0cadb77d5cd2daf98"

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
