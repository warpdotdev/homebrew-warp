cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.27.15.44.stable_01"
  sha256 arm:   "5879f4ccffb6fa040b087c54687b93b8b13b4fa3223e61b2c815f3ff758e961e",
         intel: "b357d18d6e3a5370dcec11737da6af227e9b195ed56b40ceb807e52957faa33f"

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
