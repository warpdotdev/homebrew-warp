cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.04.22.08.46.stable_03"
  sha256 arm:   "6337f8c814791d6933d5f5ad507874092a1f8f0516a32a264f9d40a41fc26f3b",
         intel: "b21cc0b3306ba224e5efa630c70e4f8e0256143b42b62d168efa606f682ba269"

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
