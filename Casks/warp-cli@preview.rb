cask "warp-cli@preview" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2025.10.08.08.12.preview_05"
  sha256 arm:   "cf89a629f6aea665f6c575d166a36bf3813b353f75f2ac64b3702f11a0db56d8",
         intel: "75fe2aa718a51c603ace182c7076619e6689579a4b9e564cb57b1d102e652c8f"

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

  binary "warp-preview"
end
