cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.18.05.32.preview_02"
  sha256 arm:   "2e2e34efe0f61e7a8c580c7ce04e64f74d5c62b526a71dd8914c1fd1b69b4242",
         intel: "e27ba53f0f052952fad6d9e9c3ef1301fd0be6491435cfb00f8b9d775ef91d67"

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
