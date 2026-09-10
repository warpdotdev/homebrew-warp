class OzAgentWorker < Formula
  desc "Self-hosted worker for Warp cloud agents"
  homepage "https://github.com/warpdotdev/oz-agent-worker"
  url "https://github.com/warpdotdev/oz-agent-worker/archive/refs/tags/v2026-09-09-16-18-52.tar.gz"
  version "2026-09-09-16-18-52"
  sha256 "ea9f61a089258fe7db7cce0f9943d136e13c6698a05011dc33f1fe5e5b6f41b4"
  license "MIT"
  head "https://github.com/warpdotdev/oz-agent-worker.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/warpdotdev/homebrew-warp/releases/download/oz-agent-worker-2026-09-09-16-18-52"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fd9ebb036ef526d65ee21ae4ee4d09872ff31a79043988af7d1ad5e76b42d5e4"
    sha256 cellar: :any,                 x86_64_linux: "30514ce1fa227b6482942767e788c5c9cd06d35ef755143feafb2dbae3eea09a"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.Version=#{version}")
  end

  test do
    system bin/"oz-agent-worker", "--help"
  end
end
