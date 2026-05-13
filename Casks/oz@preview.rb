cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.06.15.42.preview_05"
  sha256 arm:   "4606fd62b7eaea86992acf9b42d4241975a9662783c82a2a52c9732d18251866",
         intel: "bd4dea3c4f3d0672a437c59d3a67b2d9a16c4adc5bc5db6ae54904a1fd84a98d"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz (Preview)"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("preview", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "oz-preview"
end
