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
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "90ef9ee65fb4f9ff901b990d60e60a38dfb9bd2fd91a018da7ab526644a918cd"
    sha256 cellar: :any,                 x86_64_linux: "da734588a3ee0b291b9d8efc7637726c11ffde21776a4383262d512ec76ed56c"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.Version=#{version}")
  end

  test do
    system bin/"oz-agent-worker", "--help"
  end
end
