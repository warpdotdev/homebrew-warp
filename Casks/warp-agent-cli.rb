cask "warp-agent-cli" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "0.2026.09.16.08.27.stable_01"
  sha256 arm:          "32b43666085a9d2156be1ad492a83134f0d75778bb7d1fca6ab14c12eb84ee32",
         intel:        "a35eddfea85f65e41a7473e85563bf1d7c44d38229d3f6d474ee1a674a198168",
         arm64_linux:  "5a21678729b0eef83c7af3f7b3274b3e7970682a189de16fcdc3203d84d46501",
         x86_64_linux: "6383c8930ba4f5053f0110f70cac3802dda9bc936a7217019da9ff77bfae6e3d"

  on_macos do
    depends_on macos: :sonoma
  end

  url "https://app.warp.dev/download/agent-cli/artifact?os=#{os}&arch=#{arch}&version=v#{version}"
  name "Warp Agent CLI"
  desc "Agentic development environment for command-line workflows"
  homepage "https://www.warp.dev/"

  livecheck do
    url "https://releases.warp.dev/channel_versions.json"
    strategy :json do |json|
      (json.dig("stable", "tui_version") || json.dig("stable", "version"))&.delete_prefix("v")
    end
  end

  binary "warp-tui-stable", target: "warp"
end
