cask "oz@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.02.25.08.24.preview_01"
  sha256 arm:   "a61513d883d975461f26bed7b80df8234c3df450135d346e0f79b96ab6900aeb",
         intel: "694a6a1cff6bfe13c7327260c487db6c89e462a50e2916ff6cb8567defbe132b"

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
