class OzAgentWorker < Formula
  desc "Self-hosted worker for Warp cloud agents"
  homepage "https://github.com/warpdotdev/oz-agent-worker"
  url "https://github.com/warpdotdev/oz-agent-worker/archive/refs/tags/v2026-09-22-13-41-30.tar.gz"
  version "2026-09-22-13-41-30"
  sha256 "7d99f5b3baa4054c4496a0fcaa8a1275fa446dee0566464fdb26da17660e9ca3"
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
    root_url "https://github.com/warpdotdev/homebrew-warp/releases/download/oz-agent-worker-2026-09-09-16-18-52"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "dbbfa7f16f699f942f992c847c81e58c0064cdba418d3d5e654e02b7846aacd1"
    sha256 cellar: :any,                 x86_64_linux: "197ed40bb4ff9df253d2efd46b3e8bef6d238c8f28556cea097fa21afe92b472"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.Version=#{version}")
  end

  test do
    system bin/"oz-agent-worker", "--help"
  end
end
