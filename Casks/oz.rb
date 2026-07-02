cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.06.24.09.19.stable_05"
  sha256 arm:   "d03a57f6f56145f2223b076fe6b74bb7e374078ef777052f9edc4fdc412dd125",
         intel: "e62ed7bd77ef40ae22200ddbc5c668ade67bd2e8aef44ab81293a511a24f40be"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      (json.dig("stable", "cli_version") || json.dig("stable", "version"))&.delete_prefix("v")
    end
  end

  depends_on macos: :sonoma

  binary "oz-stable", target: "oz"
end
