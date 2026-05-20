cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.18.05.32.preview_03"
  sha256 arm:   "eb54bddbe600b891f91962170ab9f961ef6bba4a21ace5af9942f65880d09019",
         intel: "b710412ab23acb63ef55e34bf62cef49ad5e8e1d66dba0cde48fc1cc1669151a"

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
