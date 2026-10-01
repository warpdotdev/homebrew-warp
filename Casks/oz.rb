cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.23.14.34.stable_01"
  sha256 arm:   "4640c1a313a52d17773a4805649463b3f30c35288d70d2be1cebf815a8777910",
         intel: "a2dbbfb13053bb655a29a367bdbed00b8148c788fbc55d44ab11913e4f840343"

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
