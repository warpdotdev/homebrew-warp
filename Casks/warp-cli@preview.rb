cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.11.19.08.12.preview_05"
  sha256 arm:   "f1742918aeeb17ad0f94d14de25c86335012270a3f750d5c62317a6baea62a3c",
         intel: "c84d55b65e9e196209733bc6ecef80c63821590126f1f314cb8b167ba2d3db4f"

  url "https://app.warp.dev/download/cli?channel=preview&os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Warp CLI (Preview)"
  desc "Command-line interface to Warp agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("preview", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "warp-preview"
end
