class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.666.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.666.0/snyk-macos"
    sha256 "a4bc507f05da80c4ef553bcc1b6936d49124f99ba942da1cf404ac41fe8bc344"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.666.0/snyk-linux"
    sha256 "5f6f800c1150047f2b6bebe8996db5f25167c8ddcb82741a72634606ba03bdc4"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
