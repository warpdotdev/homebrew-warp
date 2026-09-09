cask "oz-agent-worker" do
  arch arm: "arm64", intel: "amd64"

  version "2026-09-07-20-38-22"
  sha256 arm:          "0da99afa4809f34b7e3b336b6099c92ed08a7da55a21a68db089602d5e8a0196",
         intel:        "a0b24ac0d342a40b334f51afe2562432bf084db4a9503f028aa167fed4da9a1b",
         arm64_linux:  "6a81cc994da213cc92fdd0900cf6e95bfef3016dc7480ee8a03c63eb28f5ec9d",
         x86_64_linux: "6cde8818b2804ff0edc3d2fe05c87be4689191be74a847f938189335d09213af"

  on_macos do
    url "https://github.com/warpdotdev/oz-agent-worker/releases/download/v#{version}/oz-agent-worker-darwin-#{arch}.tar.gz"
  end
  on_linux do
    url "https://github.com/warpdotdev/oz-agent-worker/releases/download/v#{version}/oz-agent-worker-linux-#{arch}.tar.gz"
  end

  name "Oz Agent Worker"
  desc "Self-hosted worker for running Oz cloud agents on your own infrastructure"
  homepage "https://github.com/warpdotdev/oz-agent-worker"

  livecheck do
    url "https://github.com/warpdotdev/oz-agent-worker/releases/latest"
    strategy :github_latest
    regex(/^v?(\d{4}-\d{2}-\d{2}-\d{2}-\d{2}-\d{2})$/i)
  end

  binary "oz-agent-worker"
end
