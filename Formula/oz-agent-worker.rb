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
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d30214a1da26387c859f6279b7b5812903c5fb24a24394f9dbfe0ffb44d0002a"
    sha256 cellar: :any,                 x86_64_linux: "f226a5202990d71d281913171ca74ab5648c440f5a9ad868a50a6fb3af9b882d"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.Version=#{version}")
  end

  test do
    system bin/"oz-agent-worker", "--help"
  end
end
