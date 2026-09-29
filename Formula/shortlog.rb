class Shortlog < Formula
  desc "Terminal client for the Shortlog notes server"
  homepage "https://github.com/zeyrie/shortlog-cli"
  url "https://github.com/zeyrie/shortlog-cli/archive/refs/tags/v0.1.0-beta.tar.gz"
  sha256 "06febe1f8de7169b0fbcb308ccccdf90105d8577fe5fe16777a3fa34eb369480"
  head "https://github.com/zeyrie/shortlog-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/shortlog"
  end

  test do
    assert_match "-api-url", shell_output("#{bin}/shortlog -h 2>&1")
  end
end
