cask "oz" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2026.05.06.15.42.stable_02"
  sha256 arm:   "b2aaa95ccad07ad050fac9f8f4255410fc6f29afd888a567d7ec3b90e29ed7dc",
         intel: "3e1f81d7cee517da9944cda16beabeb7587b728628c92954443291b9afacd7dd"

  url "https://app.warp.dev/download/cli?os=macos&package=tar&arch=#{arch}&version=v#{version}"
  name "Oz"
  desc "Command-line interface to Oz agents"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      json.dig("stable", "version")&.delete_prefix("v")
    end
  end

  depends_on macos: ">= :sonoma"

  binary "oz-stable", target: "oz"
end
