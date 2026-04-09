cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.08.08.36.stable_01"
  sha256 arm:   "52e72fcf4de643d3a851b5eeb27c247fa9c84097c37ee422aee4e17e7996b8f5",
         intel: "b3a4cd4cae81b6e3d1032363ce1c2b2bd47316b344513e3b82f415ec498ed636"

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
