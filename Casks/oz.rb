cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.14.08.27.stable_02"
  sha256 arm:   "cef8820cdbc1cf2c087864d9a077704029f3973bd39641d419edca0e4d359f81",
         intel: "fb3bb8dcadafc15f27381beb84228e7e34f3046456073b9b6b308ab8d085c3bd"

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
