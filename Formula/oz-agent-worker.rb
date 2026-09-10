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
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "07f78e6920d476fd8f263bfe36a1242b7372a3024ac81c1d2572e0c8c9793b0d"
    sha256 cellar: :any,                 x86_64_linux: "5c076a0c91609fd88004f685d364e0848bdabb19d17344504261e8dea8f33bb7"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.Version=#{version}")
  end

  test do
    system bin/"oz-agent-worker", "--help"
  end
end
