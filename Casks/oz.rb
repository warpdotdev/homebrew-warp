cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.09.30.08.29.stable_04"
  sha256 arm:   "5c7996ccabad9300e1851d475ce11d2a32ea0aecda6ff995f815fdd4a65ecd3a",
         intel: "e87ab63370e43a0d8f97f57264560e45e4b94a35cb1f7451140273907d7fc8c5"

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
