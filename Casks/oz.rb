cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.18.05.32.stable_02"
  sha256 arm:   "50f9e741b22ffaf3b365b508ebb0dbcd6286ae3e0da548d0132f0678de8721a5",
         intel: "19cd34b70a03869d875c1ffc358ed468091cd021fbb43634ea10e82d4d33d49b"

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
