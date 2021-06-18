class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.639.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.639.0/snyk-macos"
    sha256 "97c1c14cc534ce216fc7df5916870a414275abd210b6091c44d868634608db57"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.639.0/snyk-linux"
    sha256 "05a9c2f765f404d9b2811d87c260679eb23be99320fc9276b744481dc60ebd3a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
