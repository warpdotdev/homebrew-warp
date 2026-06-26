cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.24.09.19.stable_02"
  sha256 arm:   "e9161b45d02b41bdd71ece7580798a47ecba43ca72c8c41d72f43fdbf02c0960",
         intel: "7d15b0f68486a28a57e6c505bca62edafd97571cb6d07833a03142fc5029c48f"

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
