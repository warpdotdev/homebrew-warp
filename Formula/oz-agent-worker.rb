class OzAgentWorker < Formula
  desc "Self-hosted worker for Warp cloud agents"
  homepage "https://github.com/warpdotdev/oz-agent-worker"
  url "https://github.com/warpdotdev/oz-agent-worker/archive/refs/tags/v2026-10-06-14-19-34.tar.gz"
  version "2026-10-06-14-19-34"
  sha256 "f3cda820a4fb8f9955f1c333d2b88043d4f47db585a041d8bb73091900be85e8"
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
    root_url "https://github.com/warpdotdev/homebrew-warp/releases/download/oz-agent-worker-2026-10-06-14-19-34"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c7b6bec5651e27ac6a2a534a0d4cc5a776e35bdd1d36776dcb661000a4abec4f"
    sha256 cellar: :any,                 x86_64_linux: "c2365d1fb43dfd71756df49e507103e5ff56857a7c80ea464c5f37d934d2e0e9"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.Version=#{version}")
  end

  test do
    system bin/"oz-agent-worker", "--help"
  end
end
