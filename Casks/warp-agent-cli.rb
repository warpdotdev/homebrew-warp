cask "warp-agent-cli" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "0.2026.11.18.08.17.stable_05"
  sha256 arm:          "5b1a3adfae8536676b96626058d97f7508177b868b8c1e46f29e487f3037e99b",
         intel:        "b0382aa9658451ba30a9adaeb10134d0cdb091a11c0cb95696ba55c63bd4dc8f",
         arm64_linux:  "3c28a5f5dff55859ec5abe642c4d093c221fe8f3858c2b576b61b327753ac5f5",
         x86_64_linux: "4c7d00aa3f3e4c6125002cb6cf9f16b8bc12e5619c60ca9d358e3ddd770a6af4"

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
