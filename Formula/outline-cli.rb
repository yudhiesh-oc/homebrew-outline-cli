class OutlineCli < Formula
  desc "Command-line client for the Outline knowledge base"
  homepage "https://github.com/yudhiesh-oc/outline-cli"
  url "https://github.com/yudhiesh-oc/outline-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "2bee64688abae80b9f7f65e53238667f5e1b6377d2c961bc44b6a30151889cfe"
  license "MIT"
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/yudhiesh-oc/outline-cli/internal/cli.version=#{version}"
    system "go", "build", "-ldflags", ldflags, "-o", bin/"outline", "./cmd/outline"
    bin.install_symlink "outline" => "ol"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/outline --version")
    assert_match version.to_s, shell_output("#{bin}/ol --version")
  end
end
