cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.06.15.42.stable_05"
  sha256 arm:   "a7e613584431c651191212daddea3f459dab7c92763afc9eab09c9c2f78c10be",
         intel: "514075e923a08d1bab410e14e4b9d9c22e05169d0965360b0e270e5ca09c2808"

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
