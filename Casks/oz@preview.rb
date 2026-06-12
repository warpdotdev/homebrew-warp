cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.10.09.27.preview_01"
  sha256 arm:   "8328149397d583eaf4e6e9e48f4c054e56b7cc68ab85e7114bfced96165683e2",
         intel: "f782effdf161cd9290cfedfc09d2692c0471d0e5a7425c648c8634eb0381a7d2"

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

  depends_on macos: :sonoma

  binary "oz-preview"
end
