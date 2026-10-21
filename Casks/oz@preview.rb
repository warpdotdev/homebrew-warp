cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.10.14.08.27.preview_03"
  sha256 arm:   "943107ffc97ebf7594b61b8ab1b809e159d66e9cb84fddd9a8fcb5ceb456d9de",
         intel: "596fa6eb2bc25b25df254032965218505bce41baf2270768f8b5a503697beb91"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz (Preview)"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      (json.dig("preview", "cli_version") || json.dig("preview", "version"))&.delete_prefix("v")
    end
  end

  depends_on macos: :sonoma

  binary "oz-preview"
end
