cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.18.08.22.stable_02"
  sha256 arm:   "b5de4970d96bfeb163e4c5fd92748ef35bf57f8fc8e15e1c6f7f91c4f5abbbad",
         intel: "c9cdc399d56ae4fedb5b526bade5cc6a695f2fe36a05c0091ff3752920375d2c"

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
