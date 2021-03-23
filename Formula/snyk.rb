class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.506.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.506.0/snyk-macos"
    sha256 "28c35d327b451317180dfe21a69e5ad2960cfae10249c8116dd3326995571c16"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.506.0/snyk-linux"
    sha256 "cfed679659c536bb069e94f1c486e4e56985e57d74602f4f486108aacb7e7885"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
