cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.11.08.23.stable_01"
  sha256 arm:   "bd6d866597f7ff42b7817414c3142dd3169812ca0dca721adbc88f824463f353",
         intel: "b48cff2cc21207f3e77f357bff24c4305e685e92cb67e3d2914bae241528eb9d"

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
