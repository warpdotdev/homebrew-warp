class OzAgentWorker < Formula
  desc "Self-hosted worker for Warp cloud agents"
  homepage "https://github.com/warpdotdev/oz-agent-worker"
  url "https://github.com/warpdotdev/oz-agent-worker/archive/refs/tags/v2026-09-29-21-35-47.tar.gz"
  version "2026-09-29-21-35-47"
  sha256 "b34ba1e390a1ca61d3eb1d86103fec310450a9c8c0bac5fb811a20d28c5e17db"
  license "MIT"
  head "https://github.com/warpdotdev/oz-agent-worker.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
    # Releases are tagged as timestamps (e.g. `v2026-09-09-16-18-52`), so
    # the default `github_latest` regex will not match.
    regex(/^v?(\d{4}-\d{2}-\d{2}-\d{2}-\d{2}-\d{2})$/i)
  end

  bottle do
    root_url "https://github.com/warpdotdev/homebrew-warp/releases/download/oz-agent-worker-2026-09-29-21-35-47"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b012e579f46224c108d878182c2b7d07715d218dab99b38d574f27bd07434d6d"
    sha256 cellar: :any,                 x86_64_linux: "c4ed760cce702a77f83ff1bf50be6d00590e45901b61e0fd5ad0568afb18af2c"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.Version=#{version}")
  end

  test do
    system bin/"oz-agent-worker", "--help"
  end
end
