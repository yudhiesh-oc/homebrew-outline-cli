class OutlineCli < Formula
  desc "Command-line client for the Outline knowledge base"
  homepage "https://github.com/yudhiesh-oc/outline-cli"
  url "https://github.com/yudhiesh-oc/outline-cli/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "b945b28fe0f57c5b3892ab31125b11b42113eda0b44f7d5bdb7e190c908e015a"
  license "MIT"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/yudhiesh-oc/outline-cli/internal/cli.version=#{version}"
    system "go", "build", "-ldflags", ldflags, "-o", bin/"outline", "./cmd/outline"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/outline --version")
  end
end
