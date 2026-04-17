cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.15.08.45.stable_02"
  sha256 arm:   "783f1f26e9a2291647eadff5491f9a05ff7ef54699d9fc5907f3c3106b61535d",
         intel: "2420e518b256b5647be1b80e15da03f695047641bfbd7913e9118ece590f8d08"

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
