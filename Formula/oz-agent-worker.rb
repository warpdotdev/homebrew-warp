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
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "72ea41a9e503b52b97b95ff91213ed4c1efc2fa1204da410187f62ae4212e5e0"
    sha256 cellar: :any,                 x86_64_linux: "15edf39a8fc300d96f96bc330f498490118fdd9542bf2ea0bbb098e4cd8581ff"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.Version=#{version}")
  end

  test do
    system bin/"oz-agent-worker", "--help"
  end
end
